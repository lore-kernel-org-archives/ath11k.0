Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121C5C83F22
	for <ath11k@archiver.kernel.org>; Tue, 15 Jul 2025 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8FmBktC9WSRYxvxolkGYL5S4AI0gxd1QPXCyRbb+Bw=; b=Z4XcH/zQI+iliQk0FdvjImGJfR
	S1XdYUbbepB3mfYTwGyP/EpdXm1I1DUHhW+hxi7G/94iUvdIOe4o2MZAl4HkHYa8dlDtCEbmW3DzF
	A1L7Olx7Y/5empg0DgBXRO/Up3IqE05aBgSOkLlWq4b78piIBRR4qU3tdXCI8by6knhk+tOtewLkG
	ON8OEAb82CH+aDXdTF9YWE6cWWUYx+hpMSQRH9ancM/UziIC4rgIweWuDa+JFNPl2GtFjdwfP011Y
	eRMfV4f6J5rKcWg/UpGDvfMs1f8HJf9XSBLhZWvdHqBH14Tm66JZN7q+etHBHZWpaW44qOwyNwbvH
	NCxr0QHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiQ6-00000005jVh-2BEh;
	Tue, 15 Jul 2025 16:22:18 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgyO-00000005RXt-2Og1
	for ath11k@lists.infradead.org;
	Tue, 15 Jul 2025 14:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=y8FmBktC9WSRYxvxolkGYL5S4AI0gxd1QPXCyRbb+Bw=;
	b=DV3FuCcum96CB6OJl3oa/EcvfiVGdVsWmvSySDMjIyTZCnpMC4bboVdDK+mD72
	GtTSSKWuSnsg+whFjBRn8GL29NJh9i/eTQ4cD8j1VMxO6p5BvyrgKhq8LkBu0ksv
	MNbGlbHEC2XQO11n4cIfhSj3hQLoS3vZBSMdzm35evdjk=
Received: from [IPV6:240e:b8f:919b:3100:7981:39b4:a847:709a] (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAH7fhVanZoxSGjFA--.45568S2;
	Tue, 15 Jul 2025 22:48:54 +0800 (CST)
Message-ID: <7da900a6-04cd-41f7-afc8-5570eb7639e1@163.com>
Date: Tue, 15 Jul 2025 22:48:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
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
References: <20250714193214.GA2415073@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250714193214.GA2415073@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wAH7fhVanZoxSGjFA--.45568S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFW7tw18Gry7Cr1DXFW5ZFb_yoW5Xr1xpa
	yrtasIkFZ5Jr97Gw12vw1jqF4SkwnYy345G3s5tryUJw45u39xGr4xtrZY9F93WrWxW3ya
	vrZ8WwnrZFyq9a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URa0QUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:7981:39b4:a847:709a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiQwWLo2h2Y3mQSAAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_074937_330883_6E5ED14B 
X-CRM114-Status: GOOD (  21.92  )
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



On 2025/7/15 03:32, Bjorn Helgaas wrote:
> On Sun, Jul 13, 2025 at 12:05:18AM +0800, Hans Zhang wrote:
>> On 2025/7/12 17:35, Manivannan Sadhasivam wrote:
>> ...
> 
>>>> IMO the "someday" goal should be that we get rid of aspm_policy
>>>> and enable all the available power saving states by default.  We
>>>> have sysfs knobs that administrators can use if necessary, and
>>>> drivers or quirks can disable states if they need to work around
>>>> hardware defects.
>>>
>>> Yeah, I think the default should be powersave and let the users
>>> disable it for performance if they want.
>>
>> Perhaps I don't think so. At present, our company's testing team has
>> tested quite a few NVMe SSDS. As far as I can remember, the SSDS
>> from two companies have encountered problems and will hang directly
>> when turned on. We have set CONFIG_PCIEASPM_POWERSAVE=y by default.
>> When encountering SSDS from these two companies, we had to add
>> "pcie_aspm.policy=default" in the cmdline, and then the boot worked
>> normally. Currently, we do not have a PCIe protocol analyzer to
>> analyze such issues. The current approach is to modify the cmdline.
>> So I can't prove whether it's a problem with the Root Port of our
>> SOC or the SSD device.
> 
> Have you reported these?

Dear Bjorn,

I haven't reported it. Because we don't have a PCIe protocol analyzer to 
analyze this situation, it's not certain whether it's a problem with our 
SOC Root Port or the NVMe SSD. If I have time later, I will conduct a 
comparison test on the RK3588.

> 
>> Here I agree with Bjorn's statement that sometimes the EP is not
>> necessarily very standard and there are no hardware issues.
>> Personally, I think the default is default or performance. When
>> users need to save power, they should then decide whether to
>> configure it as powersave or powersupersave.  Sometimes, if the EP
>> device connected by the customer is perfect, they can turn it on to
>> save power. But if the EP is not perfect, at least they will
>> immediately know what caused the problem.
> 
> We should discover device defects as early as possible so we can add
> quirks for them.  Defaulting to ASPM being partly disabled means it
> gets much less testing and users end up passing around "fixes" like
> booting with "pcie_aspm.policy=default" or similar.  I do not want
> users to trip over a device that doesn't work and have to look for
> workarounds on the web.
> 
> I also think it's somewhat irresponsible of us to consume more power
> than necessary.  But as Mani said, this would be a big change and
> might have to be done with a BIOS date check or something to try to
> avoid regressions.
> 

Ok. I understand your purpose now.

Best regards,
Hans


