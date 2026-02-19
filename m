Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6E7C531D0
	for <ath11k@archiver.kernel.org>; Thu, 19 Feb 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=; b=iKJiI0cuUd5JTuBuYAXUfQaVc8
	7M2oibZB7t2UZSWhzV+Hxx66kgQ4cUt01nXT4vnOmhi72WEXHSCblrkCPFz/v79VaAT+5gLk9RqGZ
	fJX2nlJFQFtYwv5SDhLw/fYF9hb9KJOgW27LtDfe8D1NVJuLTZScyyVbx8iR64w4enCNiFxTw9H19
	jglSJk2C2rZ+3HMD7rZ7pVdycg12Ht2rwhw/z5iA7DMtJfi44nhY+3O/TOl/urOtG/VDS4FFMuWAI
	HwyYuY7U/L8s2rXRopbtuTqP8kDLY3oMXMUvlIrO1hZDmX5QDiwNIqlHsO33LDPTPZDna6Vfsd58b
	dXwQVIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBWr-0000000C5g9-0b1d;
	Thu, 19 Feb 2026 21:25:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBWo-0000000C5fO-0Xi6
	for ath11k@lists.infradead.org;
	Thu, 19 Feb 2026 21:25:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JJRkWf3564289
	for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 21:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=; b=CcgqruqBhDF4DmBj
	U961qpivyYUC4c43YJ87fzFdzJW/K4UcXFTfVdt350VDvcbStDpQE8v9Bq8E97AU
	wG9QrsBdU0h5/NdvJpUtwMsIEr20Z8htOFPYMIG8G8/VsyNiy2LKwYPFtJpZuZw/
	wGePOG7pwsBNpkoO1UHCUr3LOqipjap3vaeRQhVEb6ihuLjGF9bnek4Y4w8K+UTB
	xxJzB3CzbA2CEPiVmX6MFM1KUaWmkfaOLQVdeVk6Smu1jBAHy4Nut0IUJ/jeGJUY
	+IulmCQByThQGD0jrtOOs79jpiD9+WVz5aioZRJk4BoeqSdYIs3cUmqtQWTH3pXh
	81KbLw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce1k81tgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 21:25:40 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12711967e0eso1911841c88.0
        for <ath11k@lists.infradead.org>; Thu, 19 Feb 2026 13:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771536339; x=1772141139; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=;
        b=OEH+/ywNMT6fffEoiAFK4IN3DCagE7oioN+RuMK25fHB+G5tDJe7D8wbZbBSXjMtcK
         sKym0+kxIhQsVHM0sGsY6+ihRgGLw8lPMa8i0Ne+IpPs4IxpCf1+tqF41ShANv32UruH
         3KaXzIsfM6WSL2T4n8dcdhbK+vU7LrUXNDyWfJcAbZod7qEHzAT68B2NXAVej09ppUg/
         Iq20JWMne+oNYMfLKyiMkHbrvwmRFe6+D8DOtGJjcHDmxGnZkOo3sGj7mKfeRAQ/JrZG
         4OBR92DicebcN1M0A5gte1F6Rvz9OvHHVCZohZZNOvodm/xnUx8i9oSB2DjlXwERoY+7
         i42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771536339; x=1772141139;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kB8rK2ZPQwwyuY/8mrVa4LKU+9IjuHU85pf2Pkg6JGM=;
        b=QYeEBDwM2zCbdY23iJxE2aMyXS5WylQ4WKdHwMlSeQ+xVHSc9pbmCXITGN/q1V9KO9
         jHFy1sdTUgGekYxqnqE8TtuNin9VsKYYMohESAgxb5d3dSudsj0hA1HwKq4X72vmmANj
         H/R0JZwGWin+j8NmecLLkTitLoSEr/srM6hoJ5kx4M5hVsG0oOdBXc/T2qgd5iPji6I2
         QeRgGYZsxHTQZMzZulevPUHHoNKxWA89qE+KL4idvpuxHIVla1X25e25+5usG6Affq4W
         JS9AYb+lEOO3jnG90RV+wml17HE86qcD8pvamwlzVl33sCw5ATDfEOx60HORWgH7g+2K
         EgXw==
X-Forwarded-Encrypted: i=1; AJvYcCV4QNXdssvgclydU3jpv+UFKV29AMyqOMtEqqyNVMyWGB9qzhyJbVjad3c71iUVFJtNQul4kME=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGQDEdEl7ox8/HMxiRi+XdOgD8WyO5kGXRb1cQZxHQOVC7Ep1T
	bE4EoIHdFArhYQDcIHTqhEDnyI7oRYRE8D7zGCTa+1DsznCOXUCB5lvpCv2ScLIGrMb8w6mtrQH
	/sOiGi1Lm3/0DyA+wCRIWjS39d3h0o/rRnWD+7ELMMQyGal82sHBSLH/An1IvY2Kj
X-Gm-Gg: AZuq6aLqEi8wQKIiMRqj7Vk/giLVK1p6QuTZODRXj3QR6eftab/rYUpqeXWwbud6cR9
	LI2hQnxEOKK7luxxxH+M7rOnEz3BmKzF7yqwEzErtiSAFjpgmN8H/Q1IdlbHY2eeSQMcsrKmzP5
	PiNSJMqKQodm8G4629n6l9a+QlGe7bajwiDLe7BbLF7AYrkdGmTFG+0PFZoOhUvVnie+fn9pEVI
	+Dghq7mjfRQWEL/RzIB78qGNAllStBxi5QXJ+/ndL+dQXAs8TXrArEyxIsQIgY+BAR/wuVCyPKm
	xV/c6Z3owr0G1fWtFuG6I6AZJs0VDXYSCAYgrTmm9epgSnoPH1+41cMjQKKGyGBkrO/uhlNUKtY
	gCb44AKXgl1LXm29MfqSkVGQfrzWpAvQrxN/mSGDQf/OJ12daA1l790a+UYiPL7Dd46cwukeJIp
	u/k/jhYIFIR9bSEA==
X-Received: by 2002:a05:7022:2510:b0:124:9acd:3bd0 with SMTP id a92af1059eb24-12739790159mr10632452c88.5.1771536338952;
        Thu, 19 Feb 2026 13:25:38 -0800 (PST)
X-Received: by 2002:a05:7022:2510:b0:124:9acd:3bd0 with SMTP id a92af1059eb24-12739790159mr10632432c88.5.1771536338383;
        Thu, 19 Feb 2026 13:25:38 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c6430asm24324381c88.6.2026.02.19.13.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:25:37 -0800 (PST)
Message-ID: <1ad37b2f-5f3c-493e-ba3c-fec1a0377767@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 13:25:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
To: Bjorn Andersson <andersson@kernel.org>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
 <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
 <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6RM-c3yaUlugtZG38pgzPIld2l3dgUoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE5NCBTYWx0ZWRfX2hlOMWhK/XEp
 I+12RNK9sZsGK5UYH7Q6/S+LQ857fxZlwePMtrD9UfCmPD6/BWUNGLqGPwtsVcx1TfNpzEz4jVT
 Sc4zpvFe+nuQYMAM8o1XIQxNuGWXOzJA8XXWD5YDL9Y5WTrdmvPSSc6I5ePQqDsr28Jk3eB/7Vn
 R4mpoe56kjHazKkewkxW0wN/ZmT9/oiV4ZK1U8jFTxoJygnRefARYeXmfm7nBQ2foOmxsYNDidn
 JE1E6+Z5ywlVCPrmS16OqbsIL2NcuSbiDfB5ulF5QSGB7RPfql5fLllvcvA4MhNDatsbryNTHEE
 pHwFQjcT1neOygnhGHVko1RALpP40KbHsu4PHqgNKTuHIuWHnpgo+FP+0Ls2sSAVzQsLcw9jp68
 Qb9wVhZYVR6t26TE4iZbfgp3BprECCYKRbSScnK6j/90RyFy6sIYQlhR1+Dbi9Yn+ajT4v3dzoL
 4y7u4kGWAsNtpsM6Buw==
X-Authority-Analysis: v=2.4 cv=cdrfb3DM c=1 sm=1 tr=0 ts=69977fd4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=btePvF4m8IT5Eud_TlQA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 6RM-c3yaUlugtZG38pgzPIld2l3dgUoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_05,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_132542_307591_E2648B42 
X-CRM114-Status: GOOD (  23.24  )
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

On 2/19/2026 11:18 AM, Bjorn Andersson wrote:
> I reviewed the downstream code generator source and documentation.
> 
> We do generate tables matching the ath12k c-structures, i.e. variable
> length arrays are always prefixed with an uint32_t field - not a
> uint8_t or uint16_t based on elem_size.
> 
> Looking back at the original implementation of the in-kernel
> qmi_encode(), we only read elem_size bytes from the c-structure, but we
> do so into the (little-endian) uint32_t on the stack, from which we
> encode the message and act upon the result.
> 
> In qmi_decode() we decode elem_size bytes from the message into the
> (little endian) uint32_t and then write 4 bytes to the c-structure.
> 
> 
> The fix would as such seem to be to just update the length fields to be
> all uint32_t. The problem I see with this is that qmic [1] is the only
> publicly available code generator, and if we change it to always
> generate uint32_t length members, we also need to fix the
> encoder/decoder in libqrtr [2] - which will be an ABI breaking change.

And IMO that is a deal breaker since it would break the interface with all
existing legacy firmware.

> 
> If we go the other way around, the drawback is that we no longer support
> the c-structures generated by the proprietary code generator.
> 
> Worth pointing out is that the structure of the c-code is an ABI between
> the encoder/decoder, the code generator and the client - it does not
> affect the wire format.
> 
> [1] https://github.com/linux-msm/qmic
> [2] https://github.com/linux-msm/qrtr

Going back to the original implementation that reads and writes a u32 on the
stack, can we stick with that but add endian logic that correctly converts
between u32 host endian on the stack and either u8 or u16 little endian in the
messages? Is this specific to QMI_DATA_LEN TLVs?

/jeff

