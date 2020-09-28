Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMrGk-0001zj-8f
 for ath11k@lists.infradead.org; Mon, 28 Sep 2020 11:24:34 +0000
Message-ID: <4b4a0d79a243c1c3b8044730da0493c96ba294bf.camel@sipsolutions.net>
Subject: Re: [PATCHv2 1/2] nl80211: vendor-cmd: qca: add command for ap
 power save
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 28 Sep 2020 13:24:22 +0200
In-Reply-To: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 (sfid-20200824_102705_778778_5CF18948)
References: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 (sfid-20200824_102705_778778_5CF18948)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Mon, 2020-08-24 at 13:56 +0530, Venkateswara Naralasetty wrote:
> AP power save feature is to save power in AP mode, where AP goes
> to power save mode when no stations associate to it and comes out
> of power save when any station associate to AP.

Why do you think this requires a vendor command? I mean, that seems like
fairly reasonable - even by default - behaviour? And if not done by
default, it could possibly even be configured via the normal powersave
mode/command we already have in nl80211, or by a new normal one?

Why does it even require an nl80211 setting, seems like something you'd
really only want to turn off for debugging (e.g. via debugfs)?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
