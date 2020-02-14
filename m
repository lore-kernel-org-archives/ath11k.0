Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Wtr-0006MC-E4
 for ath11k@lists.infradead.org; Fri, 14 Feb 2020 09:04:40 +0000
Message-ID: <3f76962656e97793afd512c69d7836de417772ac.camel@sipsolutions.net>
Subject: Re: [PATCH V2 2/3] mac80211: add support for setting fixed HE
 rate/gi/ltf
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 14 Feb 2020 10:04:35 +0100
In-Reply-To: <20200204103514.18111-2-john@phrozen.org>
References: <20200204103514.18111-1-john@phrozen.org>
 <20200204103514.18111-2-john@phrozen.org>
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
To: John Crispin <john@phrozen.org>, Kalle Valo <kvalo@codeaurora.org>
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On Tue, 2020-02-04 at 11:35 +0100, John Crispin wrote:
> 
> +		for (j = 0; j < NL80211_HE_NSS_MAX; j++) {
> +			if (~sdata->rc_rateidx_he_mcs_mask[i][j]) {

Let's not copy-paste this weird ~ here, we can just ask if it's ! right?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
