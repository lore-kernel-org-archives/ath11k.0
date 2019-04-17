Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrgJ-0000Bn-Sn
 for ath11k@lists.infradead.org; Wed, 17 Apr 2019 21:01:25 +0000
MIME-Version: 1.0
Date: Wed, 17 Apr 2019 14:01:22 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 1/3] ath11k: enable mesh mode
In-Reply-To: <17ff1868-7c2b-efa2-2be3-8f8a504dfd62@phrozen.org>
References: <1555493358-16381-1-git-send-email-rmanohar@codeaurora.org>
 <1555493358-16381-2-git-send-email-rmanohar@codeaurora.org>
 <17ff1868-7c2b-efa2-2be3-8f8a504dfd62@phrozen.org>
Message-ID: <e1ce8ea8a82f145b5e405b69e83b6a13@codeaurora.org>
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org

On 2019-04-17 02:56, John Crispin wrote:
> On 17/04/2019 11:29, Rajkumar Manoharan wrote:
> 
>> @@ -3436,6 +3438,8 @@ static int ath11k_add_interface(struct 
>> ieee80211_hw *hw,
>>   	case NL80211_IFTYPE_STATION:
>>   		arvif->vdev_type = WMI_VDEV_TYPE_STA;
>>   		break;
>> +	case NL80211_IFTYPE_MESH_POINT:
>> +		arvif->vdev_subtype = WMI_VDEV_SUBTYPE_MESH_11S;
> 
> there should be a comment here that the drop is intentional
> 
Hmm.. Agree to have fall through comment.

-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
