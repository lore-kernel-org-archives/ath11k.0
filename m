Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfKz-0000Sp-V0
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 10:40:20 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: set TxBf parameters after vdev start
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191217164917.5040-1-john@phrozen.org>
References: <20191217164917.5040-1-john@phrozen.org>
Message-Id: <20200126104015.30968C4479C@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:40:15 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Bhagavathi Perumal S <bperumal@codeaurora.org>

John Crispin <john@phrozen.org> wrote:

> The channel info parameters are required by the firmware to process TxBf
> parameters. Currently TxBf is passed prior to the channel info. This patch
> moves TxBf setup after the channel setup.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Bhagavathi Perumal S <bperumal@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5815719dd271 ath11k: set TxBf parameters after vdev start

-- 
https://patchwork.kernel.org/patch/11298249/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
