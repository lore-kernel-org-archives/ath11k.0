Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F46CA0EE4
	for <ath11k@archiver.kernel.org>; Mon, 18 Aug 2025 06:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeidIzr/dKJkWw7XetUW6GunyrwIPKaUXOvs0jevNFA=; b=iYEX9kKz378JL/8n62XBWdwEeh
	k+2P/nOpIyL46W/STlOvCDMcvgXQG5ZFJwvrTPGwUsGAPGUPN2JwON8qLQi8Vx17pjsJjBZeXcO7q
	6Bi92XT/lZFDLarqdKsXFWdBp2XTV2xGAh7mVm9OEd/2v2531Pn3odRqeIJWhZB5I7ARGRdhHPYdu
	R/v/l/hTXq7bOYh+EWAyW9idL/0ilrGXu7PEb12LGWkDmYBwu0KSnDuPn/vHr7zbN8EAeXeQdy+6l
	zhDOoTiZpUcRLd7w/8B0MCtCIUNQ3CxC79jns5x9KF6HkESCBBK9m850LC7Io4KBz/YPet6Ea83Wu
	2fFLyUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untfQ-00000006hvX-0gRx;
	Mon, 18 Aug 2025 06:48:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsit-00000006ZkK-1cWK
	for ath11k@lists.infradead.org;
	Mon, 18 Aug 2025 05:48:00 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HNIObn001035
	for <ath11k@lists.infradead.org>; Mon, 18 Aug 2025 05:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeidIzr/dKJkWw7XetUW6GunyrwIPKaUXOvs0jevNFA=; b=WpZ5N/9lLxtvIiLL
	tvCtZGO6DxuJNKFjeGBEAEw53dQ6VjgKlknokGx5ZCc71GJ9wmZpYK1RnmMpbP/i
	EcUpg1j9CxTzngUGbVkEDfQJF9ZTWTbKa9KG5ZWPSk9S0LObhKUnnZj3OCFiI0SP
	fMwh8HxIDR70+9MuKs6TAdz6ouni790VfwOO5zeVKWSu4EwI21u23JV49aZwgUCZ
	9a1ZWtIf7oCeO0OCgSwxh4sjaUOs+BMT3fwbQtmZDn1JA47odMnL1yhcMtPZgovo
	ON7pLqDlAajFnRvPgta8UhmjASThtb5c/rs5YPpaomcdwcM8xxK7NrbGSAOBE5Gm
	ccyr0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtbheq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 18 Aug 2025 05:47:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445805d386so39098955ad.1
        for <ath11k@lists.infradead.org>; Sun, 17 Aug 2025 22:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755496077; x=1756100877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeidIzr/dKJkWw7XetUW6GunyrwIPKaUXOvs0jevNFA=;
        b=uSumFVMwX+g3zxMTSIsp/DfDuVmr55CI98B10swoHWaHvTymbAUkzcBYUVOJTBDtgX
         U2+zcBKdNFcGkAdxLINntTTkJn5ejBCJc5oWj9xJp8P2Cy74RrZtkRACPXKiAcc9+vGC
         USE09XfgrK46mkSzVsofV8P9nfpxhxjWwviWg9w3xWNVwtgMA4eHuwzRbVKMeD95FpGW
         xFBKCQpPBBF+rOU6+x5byT/jkqFXIgjElXWhp4JFiPNz5d84WhaLjWFE+cdhoenaWpaI
         4/XJPsr3vF2Yb9GNhA2Lz3VSOxVQBTqPx4NZyOSAtr9dpqxP88Tdw0Nb210UpyA11Ut8
         KIKg==
X-Forwarded-Encrypted: i=1; AJvYcCVqR9DIV/8F09c9NK3xRSChKDrz3moXm2Tq6SC1zvjQVZ3C7X6JecOxHmv3m4GE+Mx5GecWm6k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+u7ZAsciMHYNMJ3qN3r94/H7qU71bU8fARD+aSOfj3wxr+E3N
	LIexEp641lFRu/ILsfLPVI/kCztwU7HFdAtvgwI4426BYoDiapBOlDBtO180a30y7Ekj91Wa46B
	vU+ifjiv9ISnHJgwUsvY2zgfQtWPGtvK/0AQBh8NwaUiXazQw3NdASbliGloXFeQc
X-Gm-Gg: ASbGnctcva7BgUeE4OhySZzNfkOIfKpA2pttchI/dChcc0v86Q8+IGct+zbu3DqKBXS
	PeYn6UtuUFgq+/yGO9VWGn8vgmKhOc0N+cpksbBcZdJxe/xKZsclt6EXuHvb9LXWBd+gaXODL9z
	iffDYpK4rSmxNR5BVPenBczlbFFxk+XxXU87aajqjwAsiXNMEAyPR5MSSMBP58VZwAICXhkskbZ
	eRpvHe0n+yHo/3wuWrCrhsbUCzFwdZ2iWdSnFbcj4120FacxPluhF5X3+DNv6L+v0HpGu4soguc
	lN37IDgb2i/2em7TfPDaAXSwbnDWQd9pQcFK8z0zF4PHJC8CjnRPrI6ETW8LJmM4FwOHurW1ag=
	=
X-Received: by 2002:a17:902:ef02:b0:244:6b77:5b10 with SMTP id d9443c01a7336-2446d89d221mr126079015ad.36.1755496077040;
        Sun, 17 Aug 2025 22:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER4IOalNWar66B22rHJVMIAjJY1v2hPIOrJvCuOPmIDSJbaYtKfcaHS83aej4K/R2Bxeoqgw==
X-Received: by 2002:a17:902:ef02:b0:244:6b77:5b10 with SMTP id d9443c01a7336-2446d89d221mr126078695ad.36.1755496076565;
        Sun, 17 Aug 2025 22:47:56 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5a9b9esm69293305ad.167.2025.08.17.22.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 22:47:56 -0700 (PDT)
Message-ID: <bb1b095f-4198-495d-a82d-1d1d7b7367d1@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 11:17:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] bus: mhi: host: Add support to read MHI
 capabilities
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <4c68074e-5809-bc4c-185a-88ddcb81f31b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hu21TGY9KhtUWcMOEcAowD11L4nkIxOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX/Hi8AC87HhSg
 XDdT7QTU9ULhvukMZ0tScMmA78YIuOV/GpVG4elmLU8ykW7wZuhbQ2JlWYQ6EfHXzURoDjwZfdl
 2ZNm1phWWioyQPync/Jfz16LugaumS2P4ct9YKKpDUqSwyvyDGw5LfAjA4dG4q6Jg1QUVvgmeMs
 UYhfJhy7HdbJdl0etN/AdNcyiWY9KG2eAO34h2paFYcvpD7Us2qY2N690hPdhE7TVkWLpWuFwHK
 q3VXtBFfZFPIKpnFT5GGOibqdce/J1rNzhb9SXspnyHtpJxePWzfKisEV701nM2dq/In8DQ0Swx
 /Sc70j5I+bvCISOP4vFzATVmOwr2CtPc7EC7Wpw5Xphq/cZwxeVLw8FsMFy/qltJfk3gGFcWR9l
 +fxwJDOY
X-Proofpoint-GUID: hu21TGY9KhtUWcMOEcAowD11L4nkIxOE
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a2be8e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BTqdaEJVcAPEW8WuxcAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_224759_436425_BE967D65 
X-CRM114-Status: GOOD (  19.95  )
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



On 7/9/2025 5:50 PM, Ilpo Järvinen wrote:
> On Wed, 9 Jul 2025, Krishna Chaitanya Chundru wrote:
>> On 7/8/2025 10:06 PM, Manivannan Sadhasivam wrote:
>>> On Mon, Jun 09, 2025 at 04:21:24PM GMT, Krishna Chaitanya Chundru wrote:
>>>> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>>
>>>> As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
>>>> located after the ERDB array. The location of this group of registers is
>>>> indicated by the MISCOFF register. Each capability has a capability ID to
>>>> determine which functionality is supported and each capability will point
>>>> to the next capability supported.
>>>>
>>>> Add a basic function to read those capabilities offsets.
>>>>
>>>> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
>>>> Signed-off-by: Krishna Chaitanya Chundru
>>>> <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>    drivers/bus/mhi/common.h    | 13 +++++++++++++
>>>>    drivers/bus/mhi/host/init.c | 34 ++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 47 insertions(+)
>>>>
>>>> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
>>>> index
>>>> dda340aaed95a5573a2ec776ca712e11a1ed0b52..58f27c6ba63e3e6fa28ca48d6d1065684ed6e1dd
>>>> 100644
>>>> --- a/drivers/bus/mhi/common.h
>>>> +++ b/drivers/bus/mhi/common.h
>>>> @@ -16,6 +16,7 @@
>>>>    #define MHICFG				0x10
>>>>    #define CHDBOFF				0x18
>>>>    #define ERDBOFF				0x20
>>>> +#define MISCOFF				0x24
>>>>    #define BHIOFF				0x28
>>>>    #define BHIEOFF				0x2c
>>>>    #define DEBUGOFF			0x30
>>>> @@ -113,6 +114,9 @@
>>>>    #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
>>>>    #define MHISTATUS_SYSERR_MASK		BIT(2)
>>>>    #define MHISTATUS_READY_MASK		BIT(0)
>>>> +#define MISC_CAP_MASK			GENMASK(31, 0)
>>>> +#define CAP_CAPID_MASK			GENMASK(31, 24)
>>>> +#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>>>>      /* Command Ring Element macros */
>>>>    /* No operation command */
>>>> @@ -204,6 +208,15 @@
>>>>    #define MHI_RSCTRE_DATA_DWORD1
>>>> cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
>>>>    							       MHI_PKT_TYPE_COALESCING))
>>>>    +enum mhi_capability_type {
>>>> +	MHI_CAP_ID_INTX = 0x1,
>>>> +	MHI_CAP_ID_TIME_SYNC = 0x2,
>>>> +	MHI_CAP_ID_BW_SCALE = 0x3,
>>>> +	MHI_CAP_ID_TSC_TIME_SYNC = 0x4,
>>>> +	MHI_CAP_ID_MAX_TRB_LEN = 0x5,
>>>> +	MHI_CAP_ID_MAX,
>>>> +};
>>>> +
>>>>    enum mhi_pkt_type {
>>>>    	MHI_PKT_TYPE_INVALID = 0x0,
>>>>    	MHI_PKT_TYPE_NOOP_CMD = 0x1,
>>>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>>>> index
>>>> 13e7a55f54ff45b83b3f18b97e2cdd83d4836fe3..9102ce13a2059f599b46d25ef631f643142642be
>>>> 100644
>>>> --- a/drivers/bus/mhi/host/init.c
>>>> +++ b/drivers/bus/mhi/host/init.c
>>>> @@ -467,6 +467,40 @@ int mhi_init_dev_ctxt(struct mhi_controller
>>>> *mhi_cntrl)
>>>>    	return ret;
>>>>    }
>>>>    +static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32
>>>> capability, u32 *offset)
>>>> +{
>>>> +	u32 val, cur_cap, next_offset;
>>>> +	int ret;
>>>> +
>>>> +	/* Get the first supported capability offset */
>>>> +	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
>>>> MISC_CAP_MASK, offset);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	*offset = (__force u32)le32_to_cpu(*offset);
>>>
>>> Why do you need __force attribute? What does it suppress? Is it because the
>>> pointer is not le32?
>>>
>> yes to suppress warnings.
> 
> I'm pretty sure sparce with endianness checking won't be happy with that
> construct as you pass u32 where le32_to_cpu() expects __le32. Have you
> checked this with sparse? (It might not check endianness with default args.)
> 
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
I Checked this option, the mhi capabilities will not fit in to the
series mentioned for not matching the mask for cap ID, size etc. mhi
capability are similar to PCI, but they vary between mask of cap ID, 
size of the space etc. so going with current approach only.

- Krishna Chaitanya.
> 
> 

