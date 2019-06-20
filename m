Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdy7p-0006pt-5Y
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 14:33:18 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2] ath11k: fix mac_cap_info copy size
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190619061248.28891-1-john@phrozen.org>
References: <20190619061248.28891-1-john@phrozen.org>
Message-Id: <20190620143316.DF4106087F@smtp.codeaurora.org>
Date: Thu, 20 Jun 2019 14:33:16 +0000 (UTC)
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> The code currently copies the he_cap field when adding a peer from a six
> byte to an eight byte buffer. Switch from using the dest buffer length to
> that of the src buffer. Also make sure that the trailing 2 bytes are
> zero'ed out.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

c7fda8adf751 ath11k: fix mac_cap_info copy size

-- 
https://patchwork.kernel.org/patch/11003513/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
