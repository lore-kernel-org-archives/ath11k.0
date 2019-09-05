Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qPf-0004no-IA
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 11:58:58 +0000
MIME-Version: 1.0
Date: Thu, 05 Sep 2019 17:28:53 +0530
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 31/49] ath11k: add mac.c
In-Reply-To: <878sr3nfz8.fsf@kamboji.qca.qualcomm.com>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-32-git-send-email-kvalo@codeaurora.org>
 <4076919b34cad119eb4146025f587285ef40e37c.camel@sipsolutions.net>
 <ee38dc5e80097d0ebc186f81b2f11d37@codeaurora.org>
 <878sr3nfz8.fsf@kamboji.qca.qualcomm.com>
Message-ID: <8e90a557c1659995d117c6dc8b728d7f@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: devicetree@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2019-09-05 16:54, Kalle Valo wrote:
> Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> writes:
> 
>> On 2019-08-21 02:16, Johannes Berg wrote:
>>> On Tue, 2019-08-20 at 18:47 +0300, Kalle Valo wrote:
>>> 
>>>> +static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 
>>>> changed)
>>>> +{
>>>> +	struct ath11k *ar = hw->priv;
>>>> +	int ret = 0;
>>>> +
>>>> +	/* mac80211 requires this op to be present and that's why
>>>> +	 * there's an empty function, this can be extended when
>>>> +	 * required.
>>>> +	 */
>>> 
>>> Well, oops. Maybe it shouldn't be required?
>> 
>> I think we require this for some configuration handling. The comment
>> is to be updated with proper information. We'll address that.
> 
> The way I'm understanding Johannes' comment is that maybe we should
> change mac80211 to require this op to be present. Should be easy to fix
> in mac80211, right?

Ok. So make this callback optional in mac80211? should be a simple code 
change.

Vasanth

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
