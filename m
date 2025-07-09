Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E002C83F03
	for <ath11k@archiver.kernel.org>; Wed,  9 Jul 2025 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeZhxlCCLyHzeZG1ulClczmMNQYSscPiCNyYdpKIAB4=; b=ZhBzjT9yYEFb80nSvqtgLSfazr
	cGYVGoM91OXBONR3LsxGNxFPhYzbsoEg3BTZmB4Q52PLWLMB7nOOwJELSn4yERmlCdDRWeXt408QV
	HJIEPmLt70URcZhMOJ+TlrrWs3NrBH5Rel/VKZLOCrz29cHqKE5HYFoYdQfbc/higcvzMXGJWQSOl
	sc0BJNM2nZY2/FC+ZyH8rb1P7O7dCqdyIJ9y4rvMgmu4lEpwfmloj0uFcncvIC0AqpvI9l5PlLMyK
	JOAm0JzeYRXr5BM7G1RI+YHWjRMr4T2S5667G5ZVjon9SHQOift6Cw0sctjnsOMDWRfYq2Je+q53+
	RF6ysK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFJ-00000009fa4-1Sj3;
	Wed, 09 Jul 2025 19:14:23 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX53-00000009DQb-1ycK
	for ath11k@lists.infradead.org;
	Wed, 09 Jul 2025 15:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=IeZhxlCCLyHzeZG1ulClczmMNQYSscPiCNyYdpKIAB4=;
	b=GN9XGPMl6WimNEvHpeuFkSNibLcYkkzX/QavC27QDXDoxwBia8VxOvtoqvUKdG
	TlDiiL3Qwi/CjHrgNyUmpj7bSAGSm+kOM+6E0rtchib1+YYUZ7WAzZ1mjKts8qli
	TzqVtso4Cgn6EV02E9P98mINOqaUBI7Rx86IsH1suUA1U=
Received: from [IPV6:240e:b8f:919b:3100:7981:39b4:a847:709a] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBnN0bbj25o6MZnDg--.7031S2;
	Wed, 09 Jul 2025 23:50:53 +0800 (CST)
Message-ID: <1429abd2-d9c8-46b9-8886-ee81feaf5602@163.com>
Date: Wed, 9 Jul 2025 23:50:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] bus: mhi: host: Add support to read MHI
 capabilities
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
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
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-3-3faa8fe92b05@qti.qualcomm.com>
 <ttjbjmixxbzatcfthaucuy3j4hosu4azpizes6ptxjnkzsawa5@5axodfdyjff2>
 <5625ffa1-f952-4646-a17a-fbbfffcdba2a@oss.qualcomm.com>
 <4c68074e-5809-bc4c-185a-88ddcb81f31b@linux.intel.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <4c68074e-5809-bc4c-185a-88ddcb81f31b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnN0bbj25o6MZnDg--.7031S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry5try3tw1rtF15Cw4rXwb_yoWDWFb_uw
	4xZ3srGFyUXF47Crn3Kwn5uanxtF42kF45Xw10v343Xwn2yF42vrs7Jr9aqa1xJFyxAF13
	Kr1F9ayfW3yUZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1TKZtUUUUU==
X-Originating-IP: [240e:b8f:919b:3100:7981:39b4:a847:709a]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiQw+Fo2hujnwdFQAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_085134_000801_AE8CCACB 
X-CRM114-Status: UNSURE (   7.87  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org



On 2025/7/9 20:20, Ilpo Järvinen wrote:
>>>> +	do {
>>>> +		if (*offset >= mhi_cntrl->reg_len)
>>>> +			return -ENXIO;
>>>> +
>>>> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		val = (__force u32)le32_to_cpu(val);
>>>> +		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
>>>> +		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
>>>> +		if (cur_cap >= MHI_CAP_ID_MAX)
>>>> +			return -ENXIO;
>>>> +
>>>> +		if (cur_cap == capability)
>>>> +			return 0;
>>>> +
>>>> +		*offset = next_offset;
>>>> +	} while (next_offset);
>>>> +
>>>> +	return -ENXIO;
>>>> +}
> 
> There's a generalization of capability search in Hans Zhang's series,
> can it be used here too?

Dear Ilpo,

Could you help add your review tag to my series of patches? Mani has 
added the Acked-by tag. If you add the review tag, I believe Bjorn will 
merge it in. At the same time, others can use the patches of my series. 
Thank you very much for your previous suggestions and time.

Best regards,
Hans



