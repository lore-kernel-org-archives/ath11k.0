Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGfFP-0005Sj-Pv
 for ath11k@lists.infradead.org; Tue, 24 Mar 2020 08:49:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2] ath11k: Add sta debugfs support to configure ADDBA and
 DELBA
References: <1584707424-31965-1-git-send-email-mkenna@codeaurora.org>
 <87o8sm87i4.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 24 Mar 2020 10:48:52 +0200
In-Reply-To: <87o8sm87i4.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 24 Mar 2020 10:46:59 +0200")
Message-ID: <87k13a87ez.fsf@kamboji.qca.qualcomm.com>
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Maharaja Kennadyrajan <mkenna@codeaurora.org> writes:
>
>> Add support to test aggregation procedures (addba/addba_resp/delba)
>> manually by adding the required callbacks in sta debugfs files.
>>
>> To enable automatic aggregation in target,
>>
>>     echo 0 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>> 	     stations/XX:XX:XX:XX:XX:XX/aggr_mode
>>
>> For manual mode,
>>
>>     echo 1 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>> 	     stations/XX:XX:XX:XX:XX:XX/aggr_mode
>>
>> To send addba response,
>>     echo 0 25 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>> 		stations/XX:XX:XX:XX:XX:XX/addba_resp
>>
>> To send addba,
>>     echo 1 32 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>> 		stations/XX:XX:XX:XX:XX:XX/addba
>>
>> To send delba,
>>     echo 0 1 37 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
>> 		  stations/XX:XX:XX:XX:XX:XX/delba
>>
>> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
>> ---
>>
>>    V2: Reabsed on top of latest ath.git tree.
>
> You need to cc linux-wireless, otherwise the patch won't go to patchwork
> and is practically invisible to me.

So please resend this as v3 and cc linux-wireless.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
