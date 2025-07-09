Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D94C83F09
	for <ath11k@archiver.kernel.org>; Wed,  9 Jul 2025 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzAznaWmjvDBxr0Q3tW6ieQZBTpTt1BwUiW915blvK8=; b=JuEgT7RwRYhST4XH+LZ42okGlW
	E8cR7eglyNF/yoG3Cp5CLw1IGNWlVxBYPmv9JjhDVhDakuyPyqe+EZIJm/Nbk3cwnuhL5GHAFp5YK
	iQBCXfnFSGkd+ykFoUWUPe1tRJYgOkP5Rlv+41mfLkotCufrou9nS7j3nCSKQxzuAsxwpdPfiC08w
	wWGy+mOIungJ53F/OIs7u5DtfZxXXBXYV26AbXnjuM/oR70383OVICpLePaxqQd1J2UX/74xJ2/RA
	EiVZSKDicinlMQpLT2CeTr1QnzWwCGjmMIC1mvfmtSq/dmdkFYOSiqIcZspxeMu0AZ1p4ZY3XXDQn
	Em04Oyiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZW4q-000000092Hq-3O3X;
	Wed, 09 Jul 2025 14:47:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTcM-00000008alR-0A6K
	for ath11k@lists.infradead.org;
	Wed, 09 Jul 2025 12:09:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697jcjf010284
	for <ath11k@lists.infradead.org>; Wed, 9 Jul 2025 12:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzAznaWmjvDBxr0Q3tW6ieQZBTpTt1BwUiW915blvK8=; b=XK0LFGIgeCIC6qbe
	HEYJm5Cjmmu9I7sT6QLpk91tlYapcdArHKQ5hGXt21y5fsG8s0uqIeBkRZKKIJwg
	2qNTZMSCW0pNZv8+z2E1zcU0gl9fMn+pHZvB4Cthp3atR2sI3sYXOYmUI9/8AW73
	Afc3q6P5wb+NX3coayjBm5p1V951ZuDB5+87AVAlmSHfWtY1WXxd2HjE28msz1pI
	hCwUwE0pfhFsoEh6gk7uIsoQNLF6rxGAeiRdbMhQT67PxCUI2bDe5FHeStI4mdTT
	Jik6wYfBH9trLGPTJPc2Q27ljmZPTR6vPleZFqxhdjKZpkhdHGIO5sbG0yf0+zHq
	Lv1NRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap0wtj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 09 Jul 2025 12:09:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31f112c90aso677357a12.0
        for <ath11k@lists.infradead.org>; Wed, 09 Jul 2025 05:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752062979; x=1752667779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GzAznaWmjvDBxr0Q3tW6ieQZBTpTt1BwUiW915blvK8=;
        b=tfOxskGQzYze/bsDAevGz6+uOR+dS2Q6ndaodHel87ZjdPnhdP0QeRfTSaeIf204+o
         5O/2jxLrrHmnyyvIE6LxMCeVu4JmNRCEAf4f27PuPMcrj4yOvtQZco2426kF9bDxIXKp
         0m6E2JfT8xc+POh6ecJyD0/i5vxle3MpybAtMwDMfXHptgLHpklAay4x+YqufRWeU+1e
         P+RKTD0KIOiNEXr5KCMyb0O1HN+btylu3jPoWNE07hTBn4ze73a2AQyhjb1bPrx4UUky
         Y3HXLGVBPqoNnt5IwgTrwSvYfVTTp2cCtA4ViTfbajeETBD4a+CEvH1rHFixlurYSdhy
         HX3A==
X-Forwarded-Encrypted: i=1; AJvYcCWi25TCpFK7YOqFvopuK5ps/2nTq30lzfoP5F0M9F2djkXqQlvO60CDABRphlBk1pHHOzPHCgk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+q5tGlzxL4APYJkoAkWrX04Zpn32RRf5woap/UM57abtqnKUn
	EM20B6X5jEN5piox0kYMSmhwiiJ0UZssbwfEXauUYr9aHSvl3C5lQntJor9RwhjNLJsjgjxuxkk
	FXh6TQ9XKszU0GiSBpDE7kDoLJD3dajthk4nOySss8C3OTLw75uc+0GHXSKpD+Tp2
X-Gm-Gg: ASbGncstSraCGbQIm8eapQMEcJx6HEEYqBXSODW4m0mQ+ROB5ccl6ianpIKCOSQSwoa
	Dakwrzz8cp5My4g5Mv7ZLnLay+esP29VInbQYjkUfDQNkoyMDv0ZKPPWJLveQDRhkXO1GiatFqE
	qin+zuFav/czhnKEEr6bEffVa20seH4NFEBu4xikTjKcwuBOWrYcFwa0sd2PkUWvG05ImjwinPw
	cqPFeY0pGC2ufvidoVm/UDiayLkLfeNi3phd6d2Hu85NNTP+ICitUS8ekj07baR2z6W73EUZxzg
	DrWcdMuGYYGlm8BeC3CPNajlRTuk6lo4ehZGWoHnQFmWOOxTdymi
X-Received: by 2002:a17:902:ef47:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23ddb586dbdmr30688695ad.9.1752062979177;
        Wed, 09 Jul 2025 05:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP5CmuLtJ9EVCj5EH3hN0FC/CSxne9G31njh1b728ZlbRWZpXih/MgtxmqEpMqJxZ6THKsVA==
X-Received: by 2002:a17:902:ef47:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23ddb586dbdmr30688305ad.9.1752062978696;
        Wed, 09 Jul 2025 05:09:38 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457e9d6sm144191025ad.151.2025.07.09.05.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 05:09:38 -0700 (PDT)
Message-ID: <5625ffa1-f952-4646-a17a-fbbfffcdba2a@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 17:39:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] bus: mhi: host: Add support to read MHI
 capabilities
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-3-3faa8fe92b05@qti.qualcomm.com>
 <ttjbjmixxbzatcfthaucuy3j4hosu4azpizes6ptxjnkzsawa5@5axodfdyjff2>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ttjbjmixxbzatcfthaucuy3j4hosu4azpizes6ptxjnkzsawa5@5axodfdyjff2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e5c04 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=wBt9fhMRhOodALO6grUA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: n0tuqtRFCuKnRFFkTsQRAC17Qt-Vr96J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEwOCBTYWx0ZWRfX2D6w/1n3xqsN
 VhHI+RSMrBu8RxU6oWv2QJLLQEGttvaYzgvyghfBxkGpPFkZe0yYCreEiwUWQUavsZDNoK6eZdy
 NOdqUkm5Vvr3/bb2fsHX1Jz3bfWZ76dzjY2NtHzgAj+Zf2KcHXcSkr7W+GpVPrIWBNXqVEJzl6+
 bZLmFFV4UBc8N8dBdWiNGfJAw/4wRSQx2pXjeFRw8nQR3EXQTdmE9kuuWStWhVe5eTgtnt/9dBe
 gWdJkyCKn4r11tlTp5+e25tKzJtbe+3HqnksI5+zbon6d0eGuq6QAK3u0FXovH2F4kdqBw81BdE
 c19qzKHTYlx6ahilwf7NSI40S+vfjGahZEMKBJYg6uww3qEDGv0A9N26fpSoRVwfSL7KEO7ztdy
 NxLngBwQPX3I59juM8yGTL/2RYphYieWFYRbEfV5KEFrm+2QbACvWn+2H1CWqqW/fT9B4BCi
X-Proofpoint-GUID: n0tuqtRFCuKnRFFkTsQRAC17Qt-Vr96J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_050942_200938_87889CE4 
X-CRM114-Status: GOOD (  19.88  )
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



On 7/8/2025 10:06 PM, Manivannan Sadhasivam wrote:
> On Mon, Jun 09, 2025 at 04:21:24PM GMT, Krishna Chaitanya Chundru wrote:
>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>
>> As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
>> located after the ERDB array. The location of this group of registers is
>> indicated by the MISCOFF register. Each capability has a capability ID to
>> determine which functionality is supported and each capability will point
>> to the next capability supported.
>>
>> Add a basic function to read those capabilities offsets.
>>
>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/common.h    | 13 +++++++++++++
>>   drivers/bus/mhi/host/init.c | 34 ++++++++++++++++++++++++++++++++++
>>   2 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
>> index dda340aaed95a5573a2ec776ca712e11a1ed0b52..58f27c6ba63e3e6fa28ca48d6d1065684ed6e1dd 100644
>> --- a/drivers/bus/mhi/common.h
>> +++ b/drivers/bus/mhi/common.h
>> @@ -16,6 +16,7 @@
>>   #define MHICFG				0x10
>>   #define CHDBOFF				0x18
>>   #define ERDBOFF				0x20
>> +#define MISCOFF				0x24
>>   #define BHIOFF				0x28
>>   #define BHIEOFF				0x2c
>>   #define DEBUGOFF			0x30
>> @@ -113,6 +114,9 @@
>>   #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
>>   #define MHISTATUS_SYSERR_MASK		BIT(2)
>>   #define MHISTATUS_READY_MASK		BIT(0)
>> +#define MISC_CAP_MASK			GENMASK(31, 0)
>> +#define CAP_CAPID_MASK			GENMASK(31, 24)
>> +#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>>   
>>   /* Command Ring Element macros */
>>   /* No operation command */
>> @@ -204,6 +208,15 @@
>>   #define MHI_RSCTRE_DATA_DWORD1		cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
>>   							       MHI_PKT_TYPE_COALESCING))
>>   
>> +enum mhi_capability_type {
>> +	MHI_CAP_ID_INTX = 0x1,
>> +	MHI_CAP_ID_TIME_SYNC = 0x2,
>> +	MHI_CAP_ID_BW_SCALE = 0x3,
>> +	MHI_CAP_ID_TSC_TIME_SYNC = 0x4,
>> +	MHI_CAP_ID_MAX_TRB_LEN = 0x5,
>> +	MHI_CAP_ID_MAX,
>> +};
>> +
>>   enum mhi_pkt_type {
>>   	MHI_PKT_TYPE_INVALID = 0x0,
>>   	MHI_PKT_TYPE_NOOP_CMD = 0x1,
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index 13e7a55f54ff45b83b3f18b97e2cdd83d4836fe3..9102ce13a2059f599b46d25ef631f643142642be 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -467,6 +467,40 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>>   	return ret;
>>   }
>>   
>> +static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability, u32 *offset)
>> +{
>> +	u32 val, cur_cap, next_offset;
>> +	int ret;
>> +
>> +	/* Get the first supported capability offset */
>> +	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF, MISC_CAP_MASK, offset);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*offset = (__force u32)le32_to_cpu(*offset);
> 
> Why do you need __force attribute? What does it suppress? Is it because the
> pointer is not le32?
> 
yes to suppress warnings.

- Krishna Chaitanya.
> - Mani
> 
>> +	do {
>> +		if (*offset >= mhi_cntrl->reg_len)
>> +			return -ENXIO;
>> +
>> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
>> +		if (ret)
>> +			return ret;
>> +
>> +		val = (__force u32)le32_to_cpu(val);
>> +		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
>> +		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
>> +		if (cur_cap >= MHI_CAP_ID_MAX)
>> +			return -ENXIO;
>> +
>> +		if (cur_cap == capability)
>> +			return 0;
>> +
>> +		*offset = next_offset;
>> +	} while (next_offset);
>> +
>> +	return -ENXIO;
>> +}
>> +
>>   int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>   {
>>   	u32 val;
>>
>> -- 
>> 2.34.1
>>
> 

