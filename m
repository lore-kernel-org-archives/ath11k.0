Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8ADC83F10
	for <ath11k@archiver.kernel.org>; Sat, 12 Jul 2025 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFk0YyJvli1XN+U/jjkn0xB8ubUiOgd+hURsOqBNf9A=; b=OFFttnobXovlWOcaIxxSIPM2Oo
	XbMofMKnnIb0DbxHSp68NonZkNLKBexEepJexJgt07Y9AdspCelHwdLXW9WbVbHpdq/qoA1XR8VKF
	DCb9Nu1vmucQG3k2GvUyfptngodOl1KSYWymWrsMiNOiAVlm/EtWWa+5vxuehEkoMwsiS41f45Is9
	5Q2U7lzDXXJoMGsq3ljcb68YykGHeadIU8/K3JjmC8Xlu076M/ANeP/+VvPsd3WTSMWB+i7HAtNUC
	tGIPuDuVFKHGmeM/i5oOYC47NmKxAUUGga3D7UgcEJEQ7g0LBxRiDl+sLg/a3dvVDrlMp6qwzVkyJ
	TvSJUQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uacjo-0000000GmuN-0ceS;
	Sat, 12 Jul 2025 16:06:08 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uacjl-0000000Gmu1-3PVB
	for ath11k@lists.infradead.org;
	Sat, 12 Jul 2025 16:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=yFk0YyJvli1XN+U/jjkn0xB8ubUiOgd+hURsOqBNf9A=;
	b=S+j6qs763V46bHzoyxwgydQT5N0u4ktlfIpn1OKSgRh5nwt7hFgfhQQleZ64pn
	mdWlwlSBdXqDssSuyxqXbTVW/VBnwirbYVaOu1b+bgbFd0K7ZnRCeQZx0xesnmns
	Fg1C8l2sQsnxjonA9XQ2BThELeyWA4v9Mpuq3YDgtN8ME=
Received: from [IPV6:240e:b8f:919b:3100:7981:39b4:a847:709a] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHkby7h3JoR4ilAA--.23899S2;
	Sun, 13 Jul 2025 00:05:17 +0800 (CST)
Message-ID: <470742a6-861e-498e-9da4-1fa213969c7e@163.com>
Date: Sun, 13 Jul 2025 00:05:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <qay63njqf7z7mchizt5sm66i67rvxxxicikxmfuvllmmxfy7ek@mulnjvde5q7w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: QCgvCgCHkby7h3JoR4ilAA--.23899S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1ftFy5uw13Zr43KF1kuFg_yoW8uFW8pF
	Wrtr9aka1kAF97Cw12yw1UJFyFyw4SyryYk348Xw1UAF45uasrGr4UtrWruF9xXrWxWw4Y
	vr4jgF1Dua4q9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UiZ2-UUUUU=
X-Originating-IP: [240e:b8f:919b:3100:7981:39b4:a847:709a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwuIo2hyg6ZSywAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_090606_356492_FD98808E 
X-CRM114-Status: GOOD (  15.46  )
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



On 2025/7/12 17:35, Manivannan Sadhasivam wrote:
>> We only have two callers of this (pcie-qcom.c and vmd.c, both in
>> drivers/pci/), so it's not clear to me that it needs to be in
>> include/linux/pci.h.
>>
>> I'm a little dubious about it in the first place since I don't think
>> drivers should be enabling ASPM states on their own, but pcie-qcom.c
>> and vmd.c are PCIe controller drivers, not PCI device drivers, so I
>> guess we can live with them for now.
>>
>> IMO the "someday" goal should be that we get rid of aspm_policy and
>> enable all the available power saving states by default.  We have
>> sysfs knobs that administrators can use if necessary, and drivers or
>> quirks can disable states if they need to work around hardware
>> defects.
>>
> 
> Yeah, I think the default should be powersave and let the users disable it for
> performance if they want.
> 

Dear Bjorn and Mani,

Perhaps I don't think so. At present, our company's testing team has 
tested quite a few NVMe SSDS. As far as I can remember, the SSDS from 
two companies have encountered problems and will hang directly when 
turned on. We have set CONFIG_PCIEASPM_POWERSAVE=y by default. When 
encountering SSDS from these two companies, we had to add 
"pcie_aspm.policy=default" in the cmdline, and then the boot worked 
normally. Currently, we do not have a PCIe protocol analyzer to analyze 
such issues. The current approach is to modify the cmdline. So I can't 
prove whether it's a problem with the Root Port of our SOC or the SSD 
device.

Here I agree with Bjorn's statement that sometimes the EP is not 
necessarily very standard and there are no hardware issues. Personally, 
I think the default is default or performance. When users need to save 
power, they should then decide whether to configure it as powersave or 
powersupersave. Sometimes, if the EP device connected by the customer is 
perfect, they can turn it on to save power. But if the EP is not 
perfect, at least they will immediately know what caused the problem.

I wonder if there are others who have encountered similar problems as 
well. If I say anything wrong, please point it out. Thank you.

Best regards,
Hans


