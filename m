Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCCCC433EF
	for <ath11k@archiver.kernel.org>; Mon, 29 Nov 2021 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMCR43ZRmx95P2sqaF4rYXdSx7mWOXY8yScGbyBdPDc=; b=2WhB7ac35PfRaa
	QJbr+s2kFwKTIjMPjrS15xOzKgwRahLej8PNhKOM6HcnAAjO0kdwg579tXnm5ZEFIPLenpFG6+6w/
	ZbY6kb4W/6ESkC85lIWVgWG6GMdewLP+e4/B6wnaP/UgKJurutXSv5jxi6veEm98wv88Ukfa/8jSW
	BPIorP59zX5Rjh9O4RCma4trq+DPefxK8zqysyLLyvmTexUBep94sXTZKQC2HEbiA4usnmgt4/lSl
	s0jdepTYDTBjtQK0wG53+W4A0HTvxgv/FgLfysok/PPUWCjeAoaiRaAqT4bTJ3Lf/wMt7qucLSV7b
	ewj1HfxQmur6Lu1tHv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrbRV-0003EY-7n; Mon, 29 Nov 2021 07:51:17 +0000
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrbRS-0003D6-1u
 for ath11k@lists.infradead.org; Mon, 29 Nov 2021 07:51:15 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.121])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1E69A2045C;
 Mon, 29 Nov 2021 07:51:11 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 08:51:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0018853b231-08ce-4c1d-9d13-72c8b66df497,
 3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1ecfbea2-e5f7-b28b-5345-8b2ee82ae861@kaod.org>
Date: Mon, 29 Nov 2021 08:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch 17/22] PCI/MSI: Split out !IRQDOMAIN code
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: <linux-hyperv@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 <sparclinux@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Ashok Raj
 <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, <x86@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 <linux-pci@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <ath11k@lists.infradead.org>, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, <linux-mips@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20211126222700.862407977@linutronix.de>
 <20211126223825.093887718@linutronix.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211126223825.093887718@linutronix.de>
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8993720d-da60-4607-9d73-3bc5ffee8fa3
X-Ovh-Tracer-Id: 9686961325338364828
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheekgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_235114_276317_5CA22E6A 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


> +void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
> +{
> +	struct msi_desc *desc;
> +	int i;
> +
> +	for_each_pci_msi_entry(desc, dev) {
> +		if (desc->irq) {
> +			for (i = 0; i < entry->nvec_used; i++)

I guess this is 'desc' ?

Thanks,

C.

> +				arch_teardown_msi_irq(desc->irq + i);
> +		}
> +	}
> +}

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
