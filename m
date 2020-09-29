Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNHYb-0002PM-Cb
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 15:28:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 34so4119135pgo.13
 for <ath11k@lists.infradead.org>; Tue, 29 Sep 2020 08:28:43 -0700 (PDT)
Date: Tue, 29 Sep 2020 20:58:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 00/21] MHI changes for v5.10
Message-ID: <20200929152834.GA17845@Mani-XPS-13-9360>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: gregkh@linuxfoundation.org
Cc: jhugo@codeaurora.org, linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org, linux-kernel@vger.kernel.org, hemantk@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

Hi Greg,

On Mon, Sep 28, 2020 at 09:39:30AM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> Here is the MHI series for v5.10 cycle. Most of the patches are cleanups
> in the MHI stack. Notable changes are below:
> 
> * Saving the client device hardware information obtained through the BHI
>   protocol. This information will be exposed through sysfs to make use in
>   the userland applications.
> * Introduce sysfs entries to read the serial number and OEM PK hash values
>   of the client device obtained from BHI protocol. Relevant API documentation
>   is also added.
> * Introduce debugfs entries to show MHI states, events, channels, register
>   state etc... to aid debug.
> * Remove the channel name from MHI device name as the device is not specific
>   to channels. Used generic names instead!
> * Fix the warning reported by Kbuild bot by using append (+=) Kbuild rule
>   to the mhi/core Makefile.
> * Introduce APIs to allocate and free MHI controllers. This is done to make
>   sure that the allocated structs are initialized to NULL before passing to
>   the MHI core.
> * Remove the requirement to have a dedicated IRQ for each event ring.
>   The MHI controllers can now use a single IRQ for all event rings.
> * Remove the auto-start option for MHI channels. This is done to avoid
>   receiving spurious uplink from MHI client device when the client driver
>   is not up. The corresponding qrtr change is also included with Dave's ACK.
> 
> Please consider merging!
> 

Can you please drop the below two patches while applying this series?

bus: mhi: Remove auto-start option
net: qrtr: Start MHI channels during init

We realized that without these patches, net-next will be broken for QCA6390.
Proper way to handle this is by using an immutable branch or by carrying the
ath11k change through MHI tree. We decided to handle this in next merge window.

Or if you prefer to have a next revision of the series without these patches
I can send it. Please let me know!

Thanks,
Mani

> Thanks,
> Mani
> 
> Changes in v2:
> 
> * Clubbed both series (take one and two) onto a single one
> * Used dev_groups to manage sysfs attributes
> * Merged the debugfs fix patch with the debugfs patch
> * Dropped MAX_MTU patch for now
> 
> Bhaumik Bhatt (12):
>   bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task()
>     declaration
>   bus: mhi: core: Abort suspends due to outgoing pending packets
>   bus: mhi: core: Use helper API to trigger a non-blocking host resume
>   bus: mhi: core: Trigger host resume if suspended during
>     mhi_device_get()
>   bus: mhi: core: Use generic name field for an MHI device
>   bus: mhi: core: Introduce helper function to check device state
>   bus: mhi: core: Introduce counters to track MHI device state
>     transitions
>   bus: mhi: core: Read and save device hardware information from BHI
>   bus: mhi: core: Introduce APIs to allocate and free the MHI controller
>   bus: mhi: Fix entries based on Kconfig coding style
>   bus: mhi: core: Introduce debugfs entries for MHI
>   bus: mhi: core: Introduce sysfs entries for MHI
> 
> Clark Williams (1):
>   bus: mhi: Remove include of rwlock_types.h
> 
> Hemant Kumar (1):
>   bus: mhi: core: Add const qualifier to MHI config information
> 
> Loic Poulain (5):
>   bus: mhi: core: Allow shared IRQ for event rings
>   bus: mhi: Remove unused nr_irqs_req variable
>   bus: mhi: debugfs: Print channel context read-pointer
>   bus: mhi: Remove auto-start option
>   net: qrtr: Start MHI channels during init
> 
> Manivannan Sadhasivam (1):
>   bus: mhi: core: Fix the building of MHI module
> 
> Randy Dunlap (1):
>   bus: mhi: fix doubled words and struct image_info kernel-doc
> 
>  Documentation/ABI/stable/sysfs-bus-mhi |  21 ++
>  MAINTAINERS                            |   1 +
>  drivers/bus/mhi/Kconfig                |  20 +-
>  drivers/bus/mhi/core/Makefile          |   3 +-
>  drivers/bus/mhi/core/boot.c            |  17 +-
>  drivers/bus/mhi/core/debugfs.c         | 411 +++++++++++++++++++++++++
>  drivers/bus/mhi/core/init.c            |  96 ++++--
>  drivers/bus/mhi/core/internal.h        |  38 ++-
>  drivers/bus/mhi/core/main.c            |  27 +-
>  drivers/bus/mhi/core/pm.c              |  28 +-
>  include/linux/mhi.h                    |  53 +++-
>  net/qrtr/mhi.c                         |   5 +
>  12 files changed, 644 insertions(+), 76 deletions(-)
>  create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
>  create mode 100644 drivers/bus/mhi/core/debugfs.c
> 
> -- 
> 2.17.1
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
