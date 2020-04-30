Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4px-0006M2-7a
 for ath11k@lists.infradead.org; Thu, 30 Apr 2020 08:46:34 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V3 3/3] ath11k: add support for setting fixed HE
 rate/gi/ltf
References: <20200429145708.25992-1-john@phrozen.org>
 <20200429145708.25992-3-john@phrozen.org>
Date: Thu, 30 Apr 2020 11:46:16 +0300
In-Reply-To: <20200429145708.25992-3-john@phrozen.org> (John Crispin's message
 of "Wed, 29 Apr 2020 16:57:08 +0200")
Message-ID: <877dxxfjjb.fsf@kamboji.qca.qualcomm.com>
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
To: John Crispin <john@phrozen.org>
Cc: Miles Hu <milehu@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> From: Miles Hu <milehu@codeaurora.org>
>
> This patch adds ath11k support for setting fixed HE rate/gi/ltf values that
> we are now able to send to the kernel using nl80211. The added code is
> reusing parts of the existing code path already used for HT/VHT. The new
> helpers are symmetric to how we do it for HT/VHT.
>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: John Crispin <john@phrozen.org>

[...]

> +		if (he_ltf != 0xFF) {
> +			vdev_param = WMI_VDEV_PARAM_HE_LTF;
> +				/* start from 1 */
> +				he_ltf += 1;

Indentation looks weird here, but I can fix that during commit.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
