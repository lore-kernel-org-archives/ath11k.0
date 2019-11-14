Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVEKM-00038S-Vj
 for ath11k@lists.infradead.org; Thu, 14 Nov 2019 12:34:24 +0000
MIME-Version: 1.0
Date: Thu, 14 Nov 2019 18:03:59 +0530
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: Re: [EXT] Re: [PATCH v2 0/2] add Wide Band Scan support
In-Reply-To: <aa0257b408dc7ad6d5f457ac611e76059549737b.camel@sipsolutions.net>
References: <1572869374-9635-1-git-send-email-murugana@codeaurora.org>
 <53d45563803b3f96be0d53731408cc3af028c510.camel@sipsolutions.net>
 <00d301d593c2$bd37d8f0$37a78ad0$@codeaurora.org>
 <867302d58d3183ce7e2c7afa846027a787579b87.camel@sipsolutions.net>
 <6ea305b2ac09c340181623a23cf4180b@codeaurora.org>
 <aa0257b408dc7ad6d5f457ac611e76059549737b.camel@sipsolutions.net>
Message-ID: <2354c9e9f86b2207d6828b45e4055191@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2019-11-14 12:08, Johannes Berg wrote:
> On Mon, 2019-11-11 at 13:27 +0530, Sathishkumar Muruganandam wrote:
>> 
>> > How is this related to scanning? It sounds to me like you're just
>> > (ab)using scan as a somewhat convenient "do some channel hopping" API
>> > ...
>> >
>> 
>> Whether this can be used under "iw offchannel" with
>> NL80211_CMD_REMAIN_ON_CHANNEL?
> 
> Are you asking if I would accept wide
> channel extensions to R-O-C?

Yes, adding bandwidth config to existing command.

Something like this,

iw offchannel <freq> [HT40+|HT40-|80MHz] <duration>

> Still I guess I'd like to see an actual reason for it.

Wide band scan is actually moving to a off-channel for a
specified duration to capture 40, 80Mhz data frames.

So, I hope offchannel would accommodate this extension.

-- 
Thanks,
Sathishkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
