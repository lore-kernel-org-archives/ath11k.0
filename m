Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEto-00046S-GZ
 for ath11k@lists.infradead.org; Fri, 04 Sep 2020 16:49:17 +0000
MIME-Version: 1.0
Date: Fri, 4 Sep 2020 16:49:13 +0000
From: akolli@codeaurora.org
Subject: Re: [PATCH] ath11k: Allow debugfs to work with 2+ radios installed.
In-Reply-To: <d450eb2d-5c2d-c432-2cd5-b3121c7d27d4@candelatech.com>
References: <20200903172359.29199-1-greearb@candelatech.com>
 <0101017459a1d409-4d95a8e1-d404-4fba-a25d-b2e3075947e0-000000@us-west-2.amazonses.com>
 <d450eb2d-5c2d-c432-2cd5-b3121c7d27d4@candelatech.com>
Message-ID: <010101745a05a2b8-94b1cbf4-51b0-4bbe-bbf9-5abfa0c2dce0-000000@us-west-2.amazonses.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-09-04 21:04, Ben Greear wrote:
> On 9/4/20 8:00 AM, akolli@codeaurora.org wrote:
>> On 2020-09-03 22:53, greearb@candelatech.com wrote:
>>> From: Ben Greear <greearb@candelatech.com>
>>> 
>>> The code is trying to create an ath11k directory on debugfs
>>> root, but that fails when there is a second radio (and thus
>>> second instance of the driver).
>>> 
>> 
>> Hi Ben,
>> 
>> IPQ8074 is soc and it does not need second debugfs entry, its on AHB.
>> QCA6390 is a pci card and multiple debug entries are needed if 
>> multiple cards are available,
>> I am planning to post a patch with bus specific abstraction function 
>> which creates single debugfs for soc based radios and multiple entries 
>> for PCI based radios.
>> 
>> AHB:
>> debugfs/ath11k/IPQ8074/
>> 
>> PCI
>> debugfs/ath11k/QCA6390_0001:01:00.0/
>> debugfs/ath11k/QCA6390_0000:01:00.0/
> 
> I appreciate your feedback on this!
> 
> Why not just stick with the way ath10k does, having the ath11k debugfs 
> entry be
> under the phy debugfs directory?
> 
> Maybe there is a high-level design document for the ath11k driver 
> somewhere that
> explains how and why it is architected with the ath11k base object
> holding multiple
> phy objects?
> 

The initial ath11k driver was supporting IPQ8074, its an SOC and has 
3-radios under wifi0,
- few entries in debugfs are common for SOC,all these are under
       debugfs/ath11k/IPQ8074/
           "simulate_fw_crash"
           "soc_dp_stats"
- few entries are per radio, these are under
       debugfs/ath11k/IPQ8074/mac0/
             "ext_tx_stats"
             "ext_rx_stats"
             "pktlog_filter"
       debugfs/ath11k/IPQ8074/mac1
             "ext_tx_stats"
             "ext_rx_stats"
             "pktlog_filter"
       debugfs/ath11k/IPQ8074/mac2
             "ext_tx_stats"
             "ext_rx_stats"
             "pktlog_filter"

> And, very curious to know if you are able to get multiple QCA6390 NICs
> running on the
> same system, I'm seeing all sort of problems including NICs not always
> showing up in lspci
> and such.
> 
I am not aware of this, like to understand the output of, qrtr-lookup 
cmd

Thanks
Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
