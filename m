Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8748AC5AD49
	for <ath11k@archiver.kernel.org>; Mon,  2 Jun 2025 18:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkhb0fZJ6685MfzVSA3b9RYxGVM93ZFjX8xQbnaRk7w=; b=c3hbmJEiml1kNLz7wcWAoYWEKe
	i06uKuSTVJ+xpZsRwAG/ucgXsywyJSdZfe4yUfwhfmuqIGJTYK/XPKyeoOjnHVSz76E1vICfxwjtN
	T1R0bTDdx/CRpoCRbmBippNXM5Ij506cWK/EXO5Oj5CrlCGMlOJnXIkiTR5Y1q6y45sUjO1jKwKWb
	1GanAKfBJUsn82vBkb3If2YWCAfPMKXp42aACRKC1SCwYaERAxuzkRx13fDMwXtPhLIc9l1bnaM7p
	Uetc0K1juZktufp4jqQZsAhHglUrGFIE0csLwc1Irp+fXcHtufh8yv0zgbmVDaidyF9LH/2miJ1d1
	uHI4U+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMA8m-00000008K6T-29Ef;
	Mon, 02 Jun 2025 18:44:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMA8k-00000008K3z-1BoI
	for ath11k@lists.infradead.org;
	Mon, 02 Jun 2025 18:44:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HKK4v014020
	for <ath11k@lists.infradead.org>; Mon, 2 Jun 2025 18:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkhb0fZJ6685MfzVSA3b9RYxGVM93ZFjX8xQbnaRk7w=; b=o2pDPgXxuqsz+HTq
	p9M/mjJ7D6kxHe/RJz5w7qXbVS8v1sL7+spBWf33WLnQPGBdv3XViIYM22jpUlyb
	Op4c/mcYPG82IGIphJu68et/bwens/v7KZDr1h92tGGcTARFAtNvIJHBER2EmGnA
	CM66vWvuaOPxq+DJ+bBWbXs55TjnJwzpHrCSP5o0otKj/2jlaTH8uMwogZOKm46m
	3lBUrD088yiHQR2pMsNlsOj+MbcDxB6M7MV+vMlwR6oQXDHCcT68mbVvNOENeSK+
	oTurDLGnXzxieqJhB9cn8VGIX6SKImiVCdxIItCwxhW4J5QWa88VOyzol2MlR8gJ
	ojsecg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g91g74p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 02 Jun 2025 18:44:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74299055c3dso6233882b3a.0
        for <ath11k@lists.infradead.org>; Mon, 02 Jun 2025 11:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748889843; x=1749494643;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkhb0fZJ6685MfzVSA3b9RYxGVM93ZFjX8xQbnaRk7w=;
        b=omIwzWutHDpUTialnkzX5dPOk15KqvXitmuGXsE6ptiiHhhWId+hQRBNazJGRNYTth
         thqzgSQVbL8/iTVVajJe9nLQHt9H1wr0ydKavlKc/A4DYNpG67YxRGkrk+IyxpaEjpNJ
         cSb6gx1csHU8BhIqSk4F4Sttht4usY+tk9xc6089Zi3ur4w3aZpY+CyAxFfIgv0XDBoG
         /sB8Kq7Jrr4dUw+c709ZZtkkyXG6PHHk/CsPQhvFj1Mq07LAJERlBZWetYw9lK7/kAmQ
         43Wn1nk6sjY6uvfZyEzdQZe0YA3wgjbKTwS2Gz0Vi0uWDBCM9ayoTr7utOpwxlUz2itJ
         zt1A==
X-Forwarded-Encrypted: i=1; AJvYcCUdyKsVbZw1TOkUMvP3E7UkoIyJoCF2vKw8mCU/xT/f0KB1FVaqks3u0pF2Wf2tP0obs95xN0M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBIq2Xg/VlfEKuamcgJlqtW6O0lefaRjPvQqi8TqgxOqg9G/Aq
	R88Pm0P2UbNezaKYuf2MvprxQh5RxeK83zK8+I4obG8bL76peBcXo0WX4ywzoKrSVQhy9VckI1M
	s45KWtLgjpqQ9Kw4u4etdA4lVQ0/oCJ5xxHGCgTG1/KV/4MPsbFk6O5szx2C916kw
X-Gm-Gg: ASbGncvjvp9IenVMbsARmc4nBYrJm7nml0MX/wHkaAaykx8KC72pA+2Up/4zGPsjBMt
	cAhfdoq9cZqL9uMknZ79BMcibyfRuNSNYAgjftTZ+PR5cEG/ar/l8XcdQK2ilvL92+EPvfCBhdD
	ORRWIjxwJHjGXAI8Gysg2QAjDO5lWVQRwzoQ2A48l3N8aja+zQTjnLhT2aMDcwANTKdbMHbDfml
	sw5kNWhCE6ni5pD9PA8wQXhN9FlSaseOsS5/AGYT/yKTKVJsosSR4ZaCAZ10mjD7m79TzU67izw
	BmCeTuOaI/q3UgBg1Vr6saXc8shPuy8xECiy/ApKBxmgYz7/EZ1m6FIlyGNlidm4sJX0tkpArpT
	N6aJV
X-Received: by 2002:a05:6a20:4393:b0:218:c01:ddce with SMTP id adf61e73a8af0-21ad98bbc8amr24524343637.40.1748889842919;
        Mon, 02 Jun 2025 11:44:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh3f/0lMirOc3pBNrbZ8B3eldkYX/eh0mNVpbeV25DRUU76oAwll8v5eq7/Bs5wPVnGhE+Dw==
X-Received: by 2002:a05:6a20:4393:b0:218:c01:ddce with SMTP id adf61e73a8af0-21ad98bbc8amr24524305637.40.1748889842573;
        Mon, 02 Jun 2025 11:44:02 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafa64sm8208743b3a.93.2025.06.02.11.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 11:44:02 -0700 (PDT)
Message-ID: <1a5852c1-8595-41af-9a9c-282bd508842b@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 11:44:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath11k: validate ath11k_crypto_mode on
 top of ath11k_core_qmi_firmware_ready
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, jjohnson@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE1NCBTYWx0ZWRfX1siFYq/JMgrb
 a+E/sETf4ld7fQlnxfLFkyr8qLD0Kba5VDXSwNWkoG5V2v3tadn2bmLoFddYiMMaHqhSk9FvHEZ
 p5jK+aOy/yjYPdSGaiaU4lha4CoI+n9FWfSG7MFHVAHF+rGo0r/+Scn+cWnHvU3ADhBqYLBl8fO
 Z5y5/gA24XZfUCI5Yikmh+HaxUUztm0SfsX/S45AzFldn1KDdilDd8z29gyd7jlv2CJJ85Pie/U
 OxLdrSH7HrHC97VxwWHGsFUw2QWiA8mp3vJKh54eF2E96Y579QMFxzYNGEIzBkHqKOMeewWJVKG
 Dx1/422Tnn5udf/U/2cCAnbfL/HRF3iH3N0rvkTf2nPbn80WmJx8q57f9GVkCiQoWgllz+pyU+O
 wZ0APkmdB1FBffV+u8b0mkSGE/rA3zFVnWo8DlLJjXq8LJTWs2RyeHSvaLhZgn+kVODZWJni
X-Proofpoint-GUID: 9eHcZSOhIYGTC4u3CAlotLJRt4IC4osc
X-Authority-Analysis: v=2.4 cv=KYHSsRYD c=1 sm=1 tr=0 ts=683df0f4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=7IIfrU1qyLA2P-n2L4wA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 9eHcZSOhIYGTC4u3CAlotLJRt4IC4osc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=939 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506020154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_114406_450225_DFADA1CE 
X-CRM114-Status: GOOD (  10.38  )
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

On 5/22/2025 1:01 PM, Rodrigo Gobbi wrote:
> if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
> ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
> started/configured. Do the validation as soon as possible in order to avoid
> undoing actions in that case and also to fix the following smatch warning:
> 
> drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
> warn: missing unwind goto?
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>

Since this issue was previously reported, I'm adding:
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202304151955.oqAetVFd-lkp@intel.com/
Fixes: aa2092a9bab3 ("ath11k: add raw mode and software crypto support")


