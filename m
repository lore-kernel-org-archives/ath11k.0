Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F996C83F22
	for <ath11k@archiver.kernel.org>; Tue, 15 Jul 2025 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP7dE1bKFm+Zk1R9d8gy12/jTWzAHbDIeWSSV5I0Ffw=; b=aV5m5RJLctgDsGpxJvfK5KNmb3
	1MSWqsXSEIRAR/6ylVJduSOJ+cWlzurIyIFX31MCk7RzSoX/ryqD3XTYw0JY8VGqroxevxzCc6nkH
	GiprOWunbeRsgqJMJhLuX2eb7iBVWD+mOqo+c3z5ViLUNJhkIsCWAKG36Ktv4wCi+6+DkJC9A3S/R
	SJ+g83k0rY7zrKbzXQpQ57jD9oSKiTrIQfY3l3H9E+LE9UOgCZUzOBK+9SFGKF3EityDOxpLAUmKL
	iiVC/cXDiqthp/15+T0THzNST/ShWRRaGpXnrtWWaPpZky2BSf2F/w6zX1kU+7UMqutSqgs6jh63d
	N46HtOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiQ7-00000005jVo-1Zv9;
	Tue, 15 Jul 2025 16:22:19 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh3M-00000005SlU-2QK1
	for ath11k@lists.infradead.org;
	Tue, 15 Jul 2025 14:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=SP7dE1bKFm+Zk1R9d8gy12/jTWzAHbDIeWSSV5I0Ffw=;
	b=nehBQBhggmGzsVClzFYyo3YKVar9NmcrCXQKH8/hXqk5TfLczz5c1ul8b+/3Md
	Gi6wgadAcqQOQ3nTTgkOj1J6DmC5lmBoBBWwQ4MzVcGoj70yWjogVitdw/yXdeiT
	W/lcliVaXiL2IhxP/n8ycjonrgMtKRzJdTYd4i0BLSrKk=
Received: from [IPV6:240e:b8f:919b:3100:7981:39b4:a847:709a] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCHnzWFa3ZoCeijFA--.44532S2;
	Tue, 15 Jul 2025 22:53:58 +0800 (CST)
Message-ID: <64e0809b-b931-4820-8f61-377db0dbfc49@163.com>
Date: Tue, 15 Jul 2025 22:53:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <604ffae3-1bfc-0922-b001-f3338880eb21@linux.intel.com>
 <20250711230013.GA2309106@bhelgaas>
 <qay63njqf7z7mchizt5sm66i67rvxxxicikxmfuvllmmxfy7ek@mulnjvde5q7w>
 <470742a6-861e-498e-9da4-1fa213969c7e@163.com>
 <drj7qm65bfu7irnfyy2cfhzkqlrkvd2tuvlxrlpxyohhpjbs3x@ecgooujjynmx>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <drj7qm65bfu7irnfyy2cfhzkqlrkvd2tuvlxrlpxyohhpjbs3x@ecgooujjynmx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wCHnzWFa3ZoCeijFA--.44532S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxArWrZw1kuF45Gr4rZFykGrg_yoW5Gr43pF
	WFyFySka1kArn7Cw12qw1UJFyYyw4Syry5W34Fqw1UAFs093s7Jr47trWruF9xWr4xZw1j
	vrWYgF9rXFyq9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UizVbUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:7981:39b4:a847:709a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiQwOLo2h2Y3mlqwAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_075445_038839_F2167EA1 
X-CRM114-Status: GOOD (  21.22  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 2025/7/13 01:02, Manivannan Sadhasivam wrote:
> On Sun, Jul 13, 2025 at 12:05:18AM GMT, Hans Zhang wrote:
>>
>>
>> On 2025/7/12 17:35, Manivannan Sadhasivam wrote:
>>>> We only have two callers of this (pcie-qcom.c and vmd.c, both in
>>>> drivers/pci/), so it's not clear to me that it needs to be in
>>>> include/linux/pci.h.
>>>>
>>>> I'm a little dubious about it in the first place since I don't think
>>>> drivers should be enabling ASPM states on their own, but pcie-qcom.c
>>>> and vmd.c are PCIe controller drivers, not PCI device drivers, so I
>>>> guess we can live with them for now.
>>>>
>>>> IMO the "someday" goal should be that we get rid of aspm_policy and
>>>> enable all the available power saving states by default.  We have
>>>> sysfs knobs that administrators can use if necessary, and drivers or
>>>> quirks can disable states if they need to work around hardware
>>>> defects.
>>>>
>>>
>>> Yeah, I think the default should be powersave and let the users disable it for
>>> performance if they want.
>>>
>>
>> Dear Bjorn and Mani,
>>
>> Perhaps I don't think so. At present, our company's testing team has tested
>> quite a few NVMe SSDS. As far as I can remember, the SSDS from two companies
>> have encountered problems and will hang directly when turned on. We have set
>> CONFIG_PCIEASPM_POWERSAVE=y by default. When encountering SSDS from these
>> two companies, we had to add "pcie_aspm.policy=default" in the cmdline, and
>> then the boot worked normally. Currently, we do not have a PCIe protocol
>> analyzer to analyze such issues. The current approach is to modify the
>> cmdline. So I can't prove whether it's a problem with the Root Port of our
>> SOC or the SSD device.
>>
>> Here I agree with Bjorn's statement that sometimes the EP is not necessarily
>> very standard and there are no hardware issues. Personally, I think the
>> default is default or performance. When users need to save power, they
>> should then decide whether to configure it as powersave or powersupersave.
>> Sometimes, if the EP device connected by the customer is perfect, they can
>> turn it on to save power. But if the EP is not perfect, at least they will
>> immediately know what caused the problem.
>>
> 
> We all agree that not all endpoints are standards compliant. So if they have any
> issues with ASPM, then ASPM for those devices should be disabled in the quirks
> or in the device driver.
> 
> That said, the change that Bjorn proposed is not going to happen in the
> immediate future.

Dear Mani,

Ok, I will keep an eye on the changes of ASPM.

Best regards,
Hans


