Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwsf-00057Q-Sy
 for ath11k@lists.infradead.org; Wed, 26 Aug 2020 14:58:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V6 1/2] ath11k: switch to using ieee80211_tx_status_ext()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200803145444.473810-1-john@phrozen.org>
References: <20200803145444.473810-1-john@phrozen.org>
Message-Id: <20200826145822.8901DC43387@smtp.codeaurora.org>
Date: Wed, 26 Aug 2020 14:58:22 +0000 (UTC)
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

> This allows us to pass HE rates down into the stack.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Dropping the per and expecting Miles will address the issues. Miles, as I did
some changes to the patches in pending branch please incorporate my changes in
v7:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=52a632ec5dd0eab7e82051164d42bd35fe06af00

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=0ed5b5fc10d08b565183008a14267779d6da4bd4

2 patches set to Changes Requested.

11698305 [V6,1/2] ath11k: switch to using ieee80211_tx_status_ext()
11698303 [V6,2/2] ath11k: add more HE fields into radiotap header

-- 
https://patchwork.kernel.org/patch/11698305/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
