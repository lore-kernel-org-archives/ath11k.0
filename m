Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNIFg-00008S-B5
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 16:13:17 +0000
Date: Tue, 29 Sep 2020 18:13:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 00/21] MHI changes for v5.10
Message-ID: <20200929161319.GC1326743@kroah.com>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
 <20200929152834.GA17845@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929152834.GA17845@Mani-XPS-13-9360>
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
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: jhugo@codeaurora.org, linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org, linux-kernel@vger.kernel.org, hemantk@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

On Tue, Sep 29, 2020 at 08:58:34PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> On Mon, Sep 28, 2020 at 09:39:30AM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > Here is the MHI series for v5.10 cycle. Most of the patches are cleanups
> > in the MHI stack. Notable changes are below:
> > 
> > * Saving the client device hardware information obtained through the BHI
> >   protocol. This information will be exposed through sysfs to make use in
> >   the userland applications.
> > * Introduce sysfs entries to read the serial number and OEM PK hash values
> >   of the client device obtained from BHI protocol. Relevant API documentation
> >   is also added.
> > * Introduce debugfs entries to show MHI states, events, channels, register
> >   state etc... to aid debug.
> > * Remove the channel name from MHI device name as the device is not specific
> >   to channels. Used generic names instead!
> > * Fix the warning reported by Kbuild bot by using append (+=) Kbuild rule
> >   to the mhi/core Makefile.
> > * Introduce APIs to allocate and free MHI controllers. This is done to make
> >   sure that the allocated structs are initialized to NULL before passing to
> >   the MHI core.
> > * Remove the requirement to have a dedicated IRQ for each event ring.
> >   The MHI controllers can now use a single IRQ for all event rings.
> > * Remove the auto-start option for MHI channels. This is done to avoid
> >   receiving spurious uplink from MHI client device when the client driver
> >   is not up. The corresponding qrtr change is also included with Dave's ACK.
> > 
> > Please consider merging!
> > 
> 
> Can you please drop the below two patches while applying this series?
> 
> bus: mhi: Remove auto-start option
> net: qrtr: Start MHI channels during init
> 
> We realized that without these patches, net-next will be broken for QCA6390.
> Proper way to handle this is by using an immutable branch or by carrying the
> ath11k change through MHI tree. We decided to handle this in next merge window.
> 
> Or if you prefer to have a next revision of the series without these patches
> I can send it. Please let me know!

Please just send a new series, that way I "know" I got it right.

thanks,

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
