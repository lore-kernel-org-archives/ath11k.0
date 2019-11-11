Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU4ZS-0001C2-Nh
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 07:57:11 +0000
MIME-Version: 1.0
Date: Mon, 11 Nov 2019 13:27:09 +0530
From: Sathishkumar Muruganandam <murugana@codeaurora.org>
Subject: Re: [EXT] Re: [PATCH v2 0/2] add Wide Band Scan support
In-Reply-To: <867302d58d3183ce7e2c7afa846027a787579b87.camel@sipsolutions.net>
References: <1572869374-9635-1-git-send-email-murugana@codeaurora.org>
 <53d45563803b3f96be0d53731408cc3af028c510.camel@sipsolutions.net>
 <00d301d593c2$bd37d8f0$37a78ad0$@codeaurora.org>
 <867302d58d3183ce7e2c7afa846027a787579b87.camel@sipsolutions.net>
Message-ID: <6ea305b2ac09c340181623a23cf4180b@codeaurora.org>
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

On 2019-11-05 15:52, Johannes Berg wrote:
> On Tue, 2019-11-05 at 15:51 +0530, Sathishkumar Muruganandam wrote:
>> > Neither of these are scan use cases (at least not that are covered by
>> > nl80211 scan APIs), so that doesn't make sense.
>> >
>> 
>> Actually we had extended the existing 'iw scan' command to do Wide
>> Band Scan using nl80211 scan APIs.
> 
> Yes ... but ... that doesn't address my question.
> 
> How is this related to scanning? It sounds to me like you're just
> (ab)using scan as a somewhat convenient "do some channel hopping" API
> ...
> 

Whether this can be used under "iw offchannel" with 
NL80211_CMD_REMAIN_ON_CHANNEL?

Please provide your comments.

-- 
Thanks,
Sathishkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
