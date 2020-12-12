Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knxC3-0000D5-Vy
 for ath11k@lists.infradead.org; Sat, 12 Dec 2020 05:11:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
References: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
Date: Sat, 12 Dec 2020 07:11:28 +0200
In-Reply-To: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
 (Dmitry Baryshkov's message of "Sat, 12 Dec 2020 04:23:25 +0300")
Message-ID: <878sa34ni7.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, ath11k@lists.infradead.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hello,
>
> I've noticed the following backtrace during shutdown stage when
> rebooting RB5 board,
> using linux-next/master:
>
> [   31.060483] ath11k_pci 0000:01:00.0: shutdown
> [   31.067844] ------------[ cut here ]------------
> [   31.073111] WARNING: CPU: 4 PID: 101 at
> drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550

Do you have CONFIG_DMA_API_DEBUG disabled? There is one commit fixing a
DMA API debug warning but that should be in linux-next already:

cd6181ff7e93 ath11k: dp_rx: fix monitor status dma unmap direction

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
