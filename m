Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcs16-0005Z8-LH
 for ath11k@lists.infradead.org; Wed, 11 Nov 2020 15:26:37 +0000
Received: by mail-ej1-x62c.google.com with SMTP id o23so3262414ejn.11
 for <ath11k@lists.infradead.org>; Wed, 11 Nov 2020 07:26:34 -0800 (PST)
MIME-Version: 1.0
References: <CAHUdJJV71-feUXoAj+Xj0=83sPk8dsCRrZebp7EBPXsiDpysDg@mail.gmail.com>
In-Reply-To: <CAHUdJJV71-feUXoAj+Xj0=83sPk8dsCRrZebp7EBPXsiDpysDg@mail.gmail.com>
From: wi nk <wink@technolu.st>
Date: Wed, 11 Nov 2020 16:26:22 +0100
Message-ID: <CAHUdJJXvp9Pp0joQf77DQmM+VuEWhBEKY4gvqkS1RCwRLxPc5Q@mail.gmail.com>
Subject: Re: xps 13 9310 and MSI vector allocation
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
To: ath11k@lists.infradead.org

Sorry all for the double posting, I was having issues with my email
client.  I wanted to add a little more information to my thread.  I
modified the driver slightly to report how many vectors should be
available, and changed the minimum request to 1 to see how many
actually got allocated:

ath11k_err(ab, "number of MSI vectors available: %d",
pci_msi_vec_count(ab_pci->pdev));

dmesg:

[    8.085995] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
experimental!
[    8.088305] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
0x8e300000-0x8e3fffff 64bit]
[    8.088322] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
[    8.088356] ath11k_pci 0000:55:00.0: number of MSI vectors available: 32
[    8.088420] ath11k_pci 0000:55:00.0: failed to get 32 MSI vectors,
only 1 available
[    8.088421] ath11k_pci 0000:55:00.0: failed to enable msi: -22
[    8.088434] ath11k_pci: probe of 0000:55:00.0 failed with error -22

I guess this is related to the DMAR/BIOS bug (which only presents when
VT/VT-d is enabled) and the tables being messed up.  Is there anything
else I can try?  I'll gladly guinea pig patches for enabling the
single MSI version.

Thanks!

On Wed, Nov 11, 2020 at 12:15 PM wi nk <wink@technolu.st> wrote:
>
> Hello all!
>
>   I've been running around the internet trying to sort out my wifi
> adapter and I've landed here.  Similar to other reports I have an XPS
> 13 that is failing to load the ath11k driver.  The other thread had a
> few suggestions of kernel configuration options to try, and I've
> attempted all of them but I'm still stuck with the driver
> initialization failure:
>
> [    9.991558] ath11k_pci 0000:55:00.0: WARNING: ath11k PCI support is
> experimental!
> [    9.991984] ath11k_pci 0000:55:00.0: BAR 0: assigned [mem
> 0x8e300000-0x8e3fffff 64bit]
> [    9.992003] ath11k_pci 0000:55:00.0: enabling device (0000 -> 0002)
> [    9.992041] ath11k_pci 0000:55:00.0: failed to get 32 MSI vectors,
> only -28 available
> [    9.992043] ath11k_pci 0000:55:00.0: failed to enable msi: -28
> [    9.992056] ath11k_pci: probe of 0000:55:00.0 failed with error -28
>
>
> I've confirmed I have the VT/VT-d settings enabled in the BIOS.  The
> kernel has the irq/iommu settings from the other thread enabled.  I've
> made sure the latest BIOS update is applied.
>
> Is there anything else to be done to try to make this work on these laptops?
>
> Thanks!
> -Lee

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
