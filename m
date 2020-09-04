Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDjd-0004ml-Ad
 for ath11k@lists.infradead.org; Fri, 04 Sep 2020 15:34:44 +0000
Subject: Re: [PATCH] ath11k: Allow debugfs to work with 2+ radios installed.
References: <20200903172359.29199-1-greearb@candelatech.com>
 <0101017459a1d409-4d95a8e1-d404-4fba-a25d-b2e3075947e0-000000@us-west-2.amazonses.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <d450eb2d-5c2d-c432-2cd5-b3121c7d27d4@candelatech.com>
Date: Fri, 4 Sep 2020 08:34:38 -0700
MIME-Version: 1.0
In-Reply-To: <0101017459a1d409-4d95a8e1-d404-4fba-a25d-b2e3075947e0-000000@us-west-2.amazonses.com>
Content-Language: en-MW
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
To: akolli@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 9/4/20 8:00 AM, akolli@codeaurora.org wrote:
> On 2020-09-03 22:53, greearb@candelatech.com wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> The code is trying to create an ath11k directory on debugfs
>> root, but that fails when there is a second radio (and thus
>> second instance of the driver).
>>
> 
> Hi Ben,
> 
> IPQ8074 is soc and it does not need second debugfs entry, its on AHB.
> QCA6390 is a pci card and multiple debug entries are needed if multiple cards are available,
> I am planning to post a patch with bus specific abstraction function which creates single debugfs for soc based radios and multiple entries for PCI based radios.
> 
> AHB:
> debugfs/ath11k/IPQ8074/
> 
> PCI
> debugfs/ath11k/QCA6390_0001:01:00.0/
> debugfs/ath11k/QCA6390_0000:01:00.0/

I appreciate your feedback on this!

Why not just stick with the way ath10k does, having the ath11k debugfs entry be
under the phy debugfs directory?

Maybe there is a high-level design document for the ath11k driver somewhere that
explains how and why it is architected with the ath11k base object holding multiple
phy objects?

And, very curious to know if you are able to get multiple QCA6390 NICs running on the
same system, I'm seeing all sort of problems including NICs not always showing up in lspci
and such.

Thanks,
Ben

> 
> Thanks
> Anil
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
