Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfzpc-0002XZ-6U
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 06:23:40 +0000
Received: by mail-pl1-x643.google.com with SMTP id s2so4337731plr.9
 for <ath11k@lists.infradead.org>; Thu, 19 Nov 2020 22:23:38 -0800 (PST)
Date: Fri, 20 Nov 2020 11:53:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] net: qrtr: Unprepare MHI channels during remove
Message-ID: <20201120062329.GC3909@work>
References: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
 <20201119211046.64294cf6@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
 <20201120061512.GB3909@work>
 <20201119221828.72ba151a@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119221828.72ba151a@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
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

On Thu, Nov 19, 2020 at 10:18:28PM -0800, Jakub Kicinski wrote:
> On Fri, 20 Nov 2020 11:45:12 +0530 Manivannan Sadhasivam wrote:
> > Jakub, can you please provide your ack so that I can take it?
> 
> Sure:
> 
> Acked-by: Jakub Kicinski <kuba@kernel.org>

Patch applied to mhi-ath11k-immutable.

Thanks,
Mani

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
