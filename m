Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37368C0218F
	for <ath11k@archiver.kernel.org>; Tue,  4 Feb 2025 04:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrogID1pMYZlystqZnXZfqQzhY2nVkZQoJG9ivvC1+k=; b=G3YZUEFKgeiU2edynKpBH5rzBc
	OrLhbt2L5H7hgPr9R182q+LUwHQT0Tug72/KJn/81SVhmmNMGWGqKr1yJhvjjSKSmZ/ebH56E7PNz
	mmPp167hRAbmMhy2SrqLBf1UgLJNBgSCGGzljfcLXKbXq5x2HLdOhG0cerxrLjrBiHbcv08uYPekp
	EWtbZds1kz5t0g7SwZG62Cd+NG6OO1k/r2h8ODhGTrP7wzA1I7L0KszWL0CYJIcr61kpS2mKO+PYq
	79JSXcyPntn7SIH1drtw7Tot6PLQsIGrU/V8+HIQnDgBhLqls/wzR8OccCOirxs0yjVpJecjYOXsb
	cemEcRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAkR-0000000HFGY-3gfn;
	Tue, 04 Feb 2025 04:41:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAkP-0000000HFFp-1YPX
	for ath11k@lists.infradead.org;
	Tue, 04 Feb 2025 04:41:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513JlrCc029157
	for <ath11k@lists.infradead.org>; Tue, 4 Feb 2025 04:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrogID1pMYZlystqZnXZfqQzhY2nVkZQoJG9ivvC1+k=; b=CztxU1dg06YtwAmg
	qQxlYJoV3Hx/PoontgKTgfIKOWf/Lvg3PVMU7JmSbrbAN6DjrcHtEDiuaOpJ+jOj
	voaK6dWpmk2KDKEZcku6Vcfcbh+AjG0RX85ojRA9tV0XlP8t8BH1zpniycu5rbVa
	L7dYudmfLAO77BVsPxgKjmSKHq9OxW2T3On5sBiXYDCPyf3Hcyz24pNw9KC7q+lv
	tYyZmBetTlpddppx5TPEKDO8++o4IhlmZSari8YWSJ+t4aR3azZjAYV/Rk86YXsI
	kvaP0K9qC9kWUBUWlEqdLQ+9ycsBhr8vMAWGPpeAVUqaUN41eLHAr5o7+KeH7J/w
	qWf+5Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k492gwv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 04:41:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so9486853a91.3
        for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 20:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738644076; x=1739248876;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrogID1pMYZlystqZnXZfqQzhY2nVkZQoJG9ivvC1+k=;
        b=DiOCvz4BfBkjWg9FJNU02K0gYZv+7sYL28bScseTAEMb0Hf2px9O1FvGhrvQUN4cGV
         mpK5ODE9A4rdk362w8Mr0gKFznaxoNptEK+SGdZ7tUGnpZGwmcbFG2mKcRHnJWvBboWB
         yOfZurrHsarsKW5ilEqy3YZahsJs7c/df5u+6VydepeiEAY0Bw5vCagsazl4Oa8z56tW
         zwKtVQ5/UuY6DgE7mkzWM25+g/987E+fpo0t8+NKm9A1U75oMlNpDFB8C3X3EUO/MTek
         UodznWzrtrkDjMXJKYWv0ENs/kD3Q19JeMV12vHCPDaAfFguKGCI2O3M9Tn0OW/YKIEO
         VVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSQClCfcrGZc1QEKLSKZusFkOzUGuTeYfyzQnaxp127J0tKgysf4ebVRFVDjiTxY8EIJZlUz8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLo20QeTVMf+n63eUFd4ZUBARNvVpmb1iKcNf5YfZKG1aAyyQ+
	2+2HCAyO34FutDu0lQx/VnvbbFyc+B7Ts4pQx08wSPo6JZtvWyyH2XYNAlY9etHFvqZenawoPbx
	2wbel/LZF6LTAIbLrQkgi2x2du++BU3FV2PGsA9jq3z8w00HHOVjdTILkz8zI
X-Gm-Gg: ASbGncul4sm6ZlmbskI9qkHhzEitR/aZVGfiEG8850qwnJs7nJhx5pocnqkRrGtMh0c
	s56iP/Jr2Cz8acbnByftn9qwYyZuC6VToiYBIBtY90VvdIOKmcCxNBcrjypzkfYC5bETZDmMweL
	oX/ZGfLzlpKzWuO7VVLuVOhjvjHZLt91oi/SkxEYEn3hZY7JZJMmxhEw8c/SpwMRO0z76oOvrVl
	vMd/USENtA8Py+H03Ahf1utmoCA+1ft9S+CdAi2tM1eyuvbynCDE/kKgPEY1dTl0vxpzxrdOsf+
	mGNUMninrxQxiqD+w6aGwhw2DtsKXX1FTFczbjg=
X-Received: by 2002:a17:90b:534b:b0:2ee:fdf3:38dd with SMTP id 98e67ed59e1d1-2f83ac6612amr30911551a91.23.1738644075869;
        Mon, 03 Feb 2025 20:41:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEa1rhkr0CIdh+9HkLCDKMZ42p2q47VXgfsEsnBjGWTHSWtVtyZwBVtud/aKzNYvKs4QXCZmw==
X-Received: by 2002:a17:90b:534b:b0:2ee:fdf3:38dd with SMTP id 98e67ed59e1d1-2f83ac6612amr30911535a91.23.1738644075471;
        Mon, 03 Feb 2025 20:41:15 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33205c0sm85364415ad.235.2025.02.03.20.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 20:41:15 -0800 (PST)
Message-ID: <db16febb-a58e-4a60-ab1a-212c30fb5313@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 10:11:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] wifi: ath11k: pass tx arvif for MBSSID and EMA
 beacon generation
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250203214448.1978156-3-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AT5NYoChwPgIZULO22NIG4FSQ4dhuXhX
X-Proofpoint-ORIG-GUID: AT5NYoChwPgIZULO22NIG4FSQ4dhuXhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=448 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_204117_420398_3C46A2FF 
X-CRM114-Status: UNSURE (   9.79  )
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

On 2/4/25 03:14, Aloka Dixit wrote:
> Function ath11k_mac_setup_bcn_tmpl() retrieves tx_arvif only for
> a sanity check and then calls ath11k_mac_setup_bcn_tmpl_mbssid()
> or ath11k_mac_setup_bcn_tmpl_ema() both of which again retrieve
> the same pointer. Instead store the pointer and pass it to the
> latter two functions.
> 

Same, Is this tested? Perhaps you forgot to add "Tested-on:" tag?

> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---


-- 
Aditya

