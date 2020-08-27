Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBF0r-0005zi-Os
 for ath11k@lists.infradead.org; Thu, 27 Aug 2020 10:20:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath11k: return -ENOMEM on allocation failure
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200826113417.GE393664@mwanda>
References: <20200826113417.GE393664@mwanda>
Message-Id: <20200827101959.D7B6DC433CB@smtp.codeaurora.org>
Date: Thu, 27 Aug 2020 10:19:59 +0000 (UTC)
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jakub Kicinski <kuba@kernel.org>, kernel-janitors@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Returning PTR_ERR(NULL) means success, but we should return -ENOMEM.
> 
> Fixes: 1399fb87ea3e ("ath11k: register MHI controller device for QCA6390")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

fd0a09097233 ath11k: return -ENOMEM on allocation failure

-- 
https://patchwork.kernel.org/patch/11738005/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
