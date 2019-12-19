Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihyV9-0003OE-Gr
 for ath11k@lists.infradead.org; Thu, 19 Dec 2019 16:18:15 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: explicitly cast wmi commands to their correct
 struct type
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191205062645.6033-2-john@phrozen.org>
References: <20191205062645.6033-2-john@phrozen.org>
Message-Id: <20191219161806.A1C3CC447A4@smtp.codeaurora.org>
Date: Thu, 19 Dec 2019 16:18:06 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> Three of the WMI command handlers were not casting to the right data type.
> Lets make the code consistent with the other handlers.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

77ea8b455ca1 ath11k: explicitly cast wmi commands to their correct struct type

-- 
https://patchwork.kernel.org/patch/11274221/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
