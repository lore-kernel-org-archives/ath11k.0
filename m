Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDCH-0002oR-Cj
 for ath11k@lists.infradead.org; Fri, 04 Sep 2020 15:00:25 +0000
MIME-Version: 1.0
Date: Fri, 4 Sep 2020 15:00:09 +0000
From: akolli@codeaurora.org
Subject: Re: [PATCH] ath11k:  Allow debugfs to work with 2+ radios installed.
In-Reply-To: <20200903172359.29199-1-greearb@candelatech.com>
References: <20200903172359.29199-1-greearb@candelatech.com>
Message-ID: <0101017459a1c865-b2619f46-39b1-42b0-b80c-c325f7f22293-000000@us-west-2.amazonses.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

On 2020-09-03 22:53, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> The code is trying to create an ath11k directory on debugfs
> root, but that fails when there is a second radio (and thus
> second instance of the driver).
> 

Hi Ben,

IPQ8074 is soc and it does not need second debugfs entry, its on AHB.
QCA6390 is a pci card and multiple debug entries are needed if multiple 
cards are available,
I am planning to post a patch with bus specific abstraction function 
which creates single debugfs for soc based radios and multiple entries 
for PCI based radios.

AHB:
debugfs/ath11k/IPQ8074/

PCI
debugfs/ath11k/QCA6390_0001:01:00.0/
debugfs/ath11k/QCA6390_0000:01:00.0/

Thanks
Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
