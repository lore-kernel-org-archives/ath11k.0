Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfzhb-0001ye-Vb
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 06:15:25 +0000
Received: by mail-pg1-x544.google.com with SMTP id i13so6418782pgm.9
 for <ath11k@lists.infradead.org>; Thu, 19 Nov 2020 22:15:22 -0800 (PST)
Date: Fri, 20 Nov 2020 11:45:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] net: qrtr: Unprepare MHI channels during remove
Message-ID: <20201120061512.GB3909@work>
References: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
 <20201119211046.64294cf6@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119211046.64294cf6@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
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
To: Jakub Kicinski <kuba@kernel.org>
Cc: loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org, cjhuang@codeaurora.org, linux-wireless@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, hemantk@codeaurora.org, clew@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

On Thu, Nov 19, 2020 at 09:10:46PM -0800, Jakub Kicinski wrote:
> On Wed, 18 Nov 2020 10:20:25 -0800 Bhaumik Bhatt wrote:
> > Reset MHI device channels when driver remove is called due to
> > module unload or any crash scenario. This will make sure that
> > MHI channels no longer remain enabled for transfers since the
> > MHI stack does not take care of this anymore after the auto-start
> > channels feature was removed.
> > 
> > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> Patch seems reasonable, Mani are you taking it or should I?
> 

Since I already picked up one qrtr patch, makese sense to pick this
also.

> Bhaumik would you mind adding a Fixes tag to be clear where 
> the issue was introduced?

This is due to the MHI auto-start change which just got queued into
mhi-next. I don't think we need a Fixes tag.

Jakub, can you please provide your ack so that I can take it?

Thanks,
Mani

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
