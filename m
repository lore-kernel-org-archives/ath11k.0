Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVtNW-0004LZ-Og
 for ath11k@lists.infradead.org; Wed, 29 May 2019 07:52:08 +0000
MIME-Version: 1.0
Date: Wed, 29 May 2019 00:52:03 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v2 0/3] ath11k: Add Mesh mode support
In-Reply-To: <1778145.5V7WxVhUSl@bentobox>
References: <1555697498-27472-1-git-send-email-rmanohar@codeaurora.org>
 <3594678.I98WQv5yxB@bentobox>
 <09bc6205f3f65f60c12613555fdba695@codeaurora.org>
 <1778145.5V7WxVhUSl@bentobox>
Message-ID: <6ffbc8b675b1dbd6d8710fa604b5e507@codeaurora.org>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, Pradeep Chitrapu <pradeepc@qti.qualcomm.com>

On 2019-05-29 00:41, Sven Eckelmann wrote:
> On Wednesday, 29 May 2019 06:26:16 CEST Rajkumar Manoharan wrote:
>> FW assert occurs, if a mesh node of different phymode/bw tries to join
>> existing mesh network. We noticed this issue when 11n device peering
>> with ath11k mesh
>> node. IMHO this shouldn't be HT/VHT specific. It is problem of mixed
>> mode.
> 
> Happens for me when both HK01 boards are set up the same way (see the 
> examples
> which I provided) in an earlier mail.
> 
Will confirm it from our side too.

> Will check it again when I was informed that the new firmware is 
> available for
> us.
> 

Yes. Latest firmware release has fixes for secured 11s mode. You have to 
cherrypick
ath11k changes[1] too.

-Rajkumar

[1] https://patchwork.kernel.org/project/ath11k/list/?series=124083

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
