Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHHQV-0005KF-0I
 for ath11k@lists.infradead.org; Fri, 19 Apr 2019 00:30:48 +0000
MIME-Version: 1.0
Date: Thu, 18 Apr 2019 17:30:45 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH 2/2] ath11k: add TWT support
In-Reply-To: <b1611f1e-2122-d613-212c-15adb239ba89@phrozen.org>
References: <20190416190840.20286-1-john@phrozen.org>
 <20190416190840.20286-2-john@phrozen.org>
 <1987e719d39c919bb1e6f660cfc3d49d@codeaurora.org>
 <b1611f1e-2122-d613-212c-15adb239ba89@phrozen.org>
Message-ID: <5892526c5a8450d1f169db0623b764d3@codeaurora.org>
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
Cc: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>

On 2019-04-17 02:36, John Crispin wrote:
> On 17/04/2019 11:14, Rajkumar Manoharan wrote:
>> On 2019-04-16 12:08, John Crispin wrote:
>>> Add target wait time wmi calls to the driver. Enable the support 
>>> inside
>>> the FW by default.
>>> 
>> Cool... Are you planning to provide option to disable and enable TWT 
>> through hostapd.
> 
> I think this would be a cfg80211 feature not a hostapd feature, but we
> can do that.
> 
Hmm.. I was referring he_twt_required option in hostapd. I see that it 
used for HE operation.
Either the same option can be used to enable/disable this feature in 
firmware or we may
add new config in start_ap().

-Rajkumar


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
