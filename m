Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVqAM-0005Qb-AK
 for ath11k@lists.infradead.org; Wed, 29 May 2019 04:26:19 +0000
MIME-Version: 1.0
Date: Tue, 28 May 2019 21:26:16 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v2 0/3] ath11k: Add Mesh mode support
In-Reply-To: <3594678.I98WQv5yxB@bentobox>
References: <1555697498-27472-1-git-send-email-rmanohar@codeaurora.org>
 <1931905.PyyBc1jC1X@bentobox> <3594678.I98WQv5yxB@bentobox>
Message-ID: <09bc6205f3f65f60c12613555fdba695@codeaurora.org>
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
Cc: ath11k@lists.infradead.org

On 2019-05-28 07:39, Sven Eckelmann wrote:
> On Tuesday, 28 May 2019 15:48:25 CEST Sven Eckelmann wrote:
> [...]
>> What else is required to get this working? I used ath11k-bringup 
>> (which
>> included these patches) and wanted to implement the HE registration 
>> part for
>> it. But it turns out that it doesn't event work here with VHT. This is 
>> what
> I
>> did on two HK01 rev B:
> [...]
> 
> Just talked to John. It seems that mesh at the moment only "works" when 
> using
> legacy (non-HT) mode (this is what he used previously - so mesh join 
> without
> freq and bandwidth):
> 
>     iw phy phy2 interface add mesh2 type mp
>     ip link set up dev mesh2
>     iw dev mesh2 mesh join testmesh
> 
> But the HT/VHT stuff is just crashing the firmware as shown in the last 
> mail.
> 
>     iw dev mesh2 mesh join testmesh freq 5180 80MHz
> 
> Also tested ph1 with "freq 2412 HT20" and it crashed the same way.
> 
Sven,

FW assert occurs, if a mesh node of different phymode/bw tries to join
existing mesh network. We noticed this issue when 11n device peering 
with ath11k mesh
node. IMHO this shouldn't be HT/VHT specific. It is problem of mixed 
mode.

-Rajkumar


-Rajkumar

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
