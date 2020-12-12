Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koC4h-0005km-5t
 for ath11k@lists.infradead.org; Sat, 12 Dec 2020 21:05:14 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id t23so3037973oov.4
 for <ath11k@lists.infradead.org>; Sat, 12 Dec 2020 13:05:06 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
 <878sa34ni7.fsf@codeaurora.org>
In-Reply-To: <878sa34ni7.fsf@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 13 Dec 2020 00:04:45 +0300
Message-ID: <CAA8EJppwnfy-Hi9pabGL-g9BgEcac6bs3jn8J1n=PPr9-y-d-A@mail.gmail.com>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, ath11k@lists.infradead.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Hello,

On Sat, 12 Dec 2020 at 08:11, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Hello,
> >
> > I've noticed the following backtrace during shutdown stage when
> > rebooting RB5 board,
> > using linux-next/master:
> >
> > [   31.060483] ath11k_pci 0000:01:00.0: shutdown
> > [   31.067844] ------------[ cut here ]------------
> > [   31.073111] WARNING: CPU: 4 PID: 101 at
> > drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550
>
> Do you have CONFIG_DMA_API_DEBUG disabled? There is one commit fixing a
> DMA API debug warning but that should be in linux-next already:
>
> cd6181ff7e93 ath11k: dp_rx: fix monitor status dma unmap direction

I have enabled CONFIG_DMA_API_DEBUG (and _SG too). Got no additional
traces during boot and the same trace during reboot.

-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
