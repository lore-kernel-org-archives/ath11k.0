Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jf2Lq-0006cV-Qt
 for ath11k@lists.infradead.org; Sat, 30 May 2020 14:20:49 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: clear DCM max constellation tx value
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1590707417-29672-1-git-send-email-msinada@codeaurora.org>
References: <1590707417-29672-1-git-send-email-msinada@codeaurora.org>
Message-Id: <20200530142040.06F15C433C9@smtp.codeaurora.org>
Date: Sat, 30 May 2020 14:20:40 +0000 (UTC)
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
To: Muna Sinada <msinada@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Muna Sinada <msinada@codeaurora.org> wrote:

> According to 11ax spec. draft 4.0. DCM Max Constellation Tx data
> field should be set to "Reserved" for an AP, therefore bit is
> cleared.
> 
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

37b76986ebd7 ath11k: clear DCM max constellation tx value

-- 
https://patchwork.kernel.org/patch/11577233/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
