Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiFy0-0004e5-O7
 for ath11k@lists.infradead.org; Mon, 08 Jun 2020 11:29:26 +0000
Subject: Re: [PATCH 12/12] ath11k: set the multiple bssid hw cap
References: <20200604070952.15481-1-john@phrozen.org>
 <20200604070952.15481-13-john@phrozen.org> <87ftb5ke5d.fsf@codeaurora.org>
From: John Crispin <john@phrozen.org>
Message-ID: <14370186-aacb-78a7-c03b-b7517e065b3d@phrozen.org>
Date: Mon, 8 Jun 2020 13:29:21 +0200
MIME-Version: 1.0
In-Reply-To: <87ftb5ke5d.fsf@codeaurora.org>
Content-Language: en-US
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
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 08.06.20 13:09, Kalle Valo wrote:
> John Crispin <john@phrozen.org> writes:
> 
>> This patch sets the SUPPORTS_MULTI_BSSID inside ath11k.
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
> 
> On what hardware and firmware did you test this?
> 
>> --- a/drivers/net/wireless/ath/ath11k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
>> @@ -109,8 +109,8 @@ enum {
>>   
>>   enum {
>>   	WMI_HOST_VDEV_FLAGS_NON_MBSSID_AP	= 1,
>> -	WMI_HOST_VDEV_FLAGS_TRANSMIT_AP		= 2,
>> -	WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP	= 4,
>> +	WMI_HOST_VDEV_FLAGS_NON_TRANSMIT_AP	= 2,
>> +	WMI_HOST_VDEV_FLAGS_TRANSMIT_AP		= 4,
> 
> I wonder if this is a safe thing to do? Do all firmware branches use
> these new values?
> 

Hi,
looks like i folded the fix patch into the wrong patch. these values get 
added in this same patchset. Johannes commented on the nl80211 part 
already and i will send out a V2 this week.
	John

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
