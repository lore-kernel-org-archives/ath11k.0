Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNAFl-0003hC-Db
 for ath11k@lists.infradead.org; Tue, 29 Sep 2020 07:40:50 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCHv2 1/2] nl80211: vendor-cmd: qca: add command for ap power
 save
References: <1598257589-19091-1-git-send-email-vnaralas@codeaurora.org>
 <4b4a0d79a243c1c3b8044730da0493c96ba294bf.camel@sipsolutions.net>
Date: Tue, 29 Sep 2020 10:40:42 +0300
In-Reply-To: <4b4a0d79a243c1c3b8044730da0493c96ba294bf.camel@sipsolutions.net>
 (Johannes Berg's message of "Mon, 28 Sep 2020 13:24:22 +0200")
Message-ID: <871rilf2th.fsf@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Johannes Berg <johannes@sipsolutions.net> writes:

> On Mon, 2020-08-24 at 13:56 +0530, Venkateswara Naralasetty wrote:
>> AP power save feature is to save power in AP mode, where AP goes
>> to power save mode when no stations associate to it and comes out
>> of power save when any station associate to AP.
>
> Why do you think this requires a vendor command? I mean, that seems like
> fairly reasonable - even by default - behaviour?

I have not studied the details, but doesn't AP power save break normal
functionality? For example, I would guess probe requests from clients
would be lost. So there's a major drawback when enabling this, right?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
