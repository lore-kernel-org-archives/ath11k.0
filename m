Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdLA-00070j-Gj
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 17:42:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/2] ath11k: fix pdev when invoking
 ath11k_wmi_send_twt_enable_cmd()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213153457.11946-1-john@phrozen.org>
References: <20191213153457.11946-1-john@phrozen.org>
Message-Id: <20191218174227.39B64C447AC@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 17:42:27 +0000 (UTC)
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> The code currently uses the wrong pdev id when enabling TWT. Fix this by
> using the correct ones.
> 
> Fixes: e65a616f4e74 ("ath11k: add TWT support")
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

485add35771b ath11k: fix pdev when invoking ath11k_wmi_send_twt_enable_cmd()
aacb46223e08 ath11k: set the BA buffer size to 256 when HE is enabled

-- 
https://patchwork.kernel.org/patch/11290725/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
