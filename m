Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfyh7-0007zm-BT
 for ath11k@lists.infradead.org; Fri, 20 Nov 2020 05:10:50 +0000
Date: Thu, 19 Nov 2020 21:10:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] net: qrtr: Unprepare MHI channels during remove
Message-ID: <20201119211046.64294cf6@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
References: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
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
To: Bhaumik Bhatt <bbhatt@codeaurora.org>, manivannan.sadhasivam@linaro.org
Cc: loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org, cjhuang@codeaurora.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org, netdev@vger.kernel.org, hemantk@codeaurora.org, ath11k@lists.infradead.org, kvalo@codeaurora.org

On Wed, 18 Nov 2020 10:20:25 -0800 Bhaumik Bhatt wrote:
> Reset MHI device channels when driver remove is called due to
> module unload or any crash scenario. This will make sure that
> MHI channels no longer remain enabled for transfers since the
> MHI stack does not take care of this anymore after the auto-start
> channels feature was removed.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Patch seems reasonable, Mani are you taking it or should I?

Bhaumik would you mind adding a Fixes tag to be clear where 
the issue was introduced?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
