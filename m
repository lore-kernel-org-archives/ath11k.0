Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91700C369C2
	for <ath11k@archiver.kernel.org>; Fri, 25 Apr 2025 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJm7MNzaH/J/vM5UQzpxkTaASRF8p22SemAyXHoKXkE=; b=Z7rolfQAx9FEHdjgywUoHY5Gdc
	FeNfWLJoJMbozv6rPhmWS1r326f/42P+x74BaXKHMn2Yq+Iwl24Sbh9qdUIkrlH+ULTKHwxy5z6Kc
	d3He8CZ8hQwb7M445rX1uMir1otMTODG5d8PKS+3bGgjDLPs09xVG/YEuy3X6ojG3UjVjh13DGT9f
	9QpXGYt+6XG2aW4o5vZ3HNDa9H7UTsnBwrRrPXK+hT4nW50LcvRAYGVUW8ys+Flv3c2rua0VmfPp7
	dOe/ACOc2enJGP17ck2w2jvgVVqO/piez+gD/XdsMX1ldypOAybAr79YEMMu7GwkKJQChejlsVguY
	dvAG4ABQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NLV-00000000TUW-25h9;
	Fri, 25 Apr 2025 18:00:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MLS-00000000JJd-0SKI
	for ath11k@lists.infradead.org;
	Fri, 25 Apr 2025 16:56:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKFQf002051
	for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 16:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PJm7MNzaH/J/vM5UQzpxkTaASRF8p22SemAyXHoKXkE=; b=TzwTxWVQ6bzMBXZc
	OR8Deu1r3Zdq3Bve4iI0fNqpAnAq2qpjvS/B5UFHd8EmMVi+VvEKdgAjV0TFOWyt
	Iibc768E9CUk4iDF3Fg97T/7hYV3i8P7Qm58RXGhLsSe4436blDdWXXnCK+2tI1R
	CJ24UugAOUT82ipQOBqmZDCuysBs8qGs4u7vti/A2iBgjCWzRHiVpSJsQwVwt333
	JSCcZjPRlNpl8/X2AsYdfapp/Yd9s0osOZCw756RHZCFR5oglO3wxXS2V9F5iIeB
	bUdGSGoHpAM0rfFy+utBjhE/J49/jgt9TCpXxhaiWmgKEvE/9H6v0DIEHG+AnfvJ
	f/C1Qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3hs17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 16:56:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22c31b55ac6so43513235ad.0
        for <ath11k@lists.infradead.org>; Fri, 25 Apr 2025 09:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745600168; x=1746204968;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJm7MNzaH/J/vM5UQzpxkTaASRF8p22SemAyXHoKXkE=;
        b=X2+bS4MoD+gsFaK9EwTx3BHSDeORSjSFjuFxNtN31vlb9c1hJMAZzp+8wkgiHz7mxL
         +j9GuRcGBebbLYX9FGMkLjEGwIHX8yAewSpA3lkK9vTvbfXzIkYLEbcX6pdBO/aJAaBo
         escIITglpZ6u+x7JM9oPYT/otru3NbRODb8iB33u0jsmM5/CK1GUaKsRCIo6bYC5bQ4v
         jy3NCt2tly0R3Sd3K8P6aWgRkGQSHpEH3eBU7ABfsMKaTCxZxaF686lMMa3urQvDh9fw
         CgZIjTG1EWEN3Ila6UUmOEcRdT1evaMenPac0b+z8r+5Xr5vC++MkCYDN+u/lIK6y4N+
         N9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVetEK4hz10p231wB3oiSe8SbVYq/NAREwU9D6KN0txak5zCD+VL8zp3WKQGUXisBTE4XvpBTU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Z6gnBZoO3hdjFeBe7Ba/DgwTjiS2GqKZbBmyoDEGgYfRM7vF
	HgAbUCIOcmcOi71Cg/SiUPLPrpqR3wcbS1p8oLaUkmfjitxJkJbxFp5QzlX5He647X/zE7kHX3h
	amWPwXOM5k4GoR4SW9IPwdHwvFPkALmzGTWjRiTUeX0r3Lv9y4rLo1i6kvGrW
X-Gm-Gg: ASbGnctP+iEqmZH4/Pe19pu0KsW8cCvhgVMvICY3cAOc5/SdRQUR9nRW91VgnyGCsLv
	XvT4c5KwtbkLoKLOqLGCJi2o0VghSKJRMhDzU6EcjhkmSHrC7nPFxcqAcFRnNYbRJ8P5/Xz/SVj
	06pA1ZMGnWLTmCQA04J+t7ch5MyoOzmYBVyFAPAXJviw0VxmEeBh37QvUOWzziqfv7UyWUv0Eqv
	COrBARTDsCbXG77rRxpLPGLUwNSTL7BDjD0gQG0CXq1hoERl4TRGjgfSqyHr3YYJK2CNruYY5Ey
	ubryYP2Zb/sgEktpe0eHeANA7ckxME4qhgho3gVRvjq42tU+EYyAyaH+wrwZKPu0jbQx8h6czZ8
	1Itj1
X-Received: by 2002:a17:902:d4d1:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22dbf6218b7mr48496515ad.40.1745600168443;
        Fri, 25 Apr 2025 09:56:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvNlnEPnYxMjrWt5k9hsuYhZYiXLEAh9EPbD1EAbWDevHLteIuL9RYWdrJGfS2IaYCzi4izQ==
X-Received: by 2002:a17:902:d4d1:b0:215:94eb:adb6 with SMTP id d9443c01a7336-22dbf6218b7mr48495765ad.40.1745600167474;
        Fri, 25 Apr 2025 09:56:07 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm34776685ad.104.2025.04.25.09.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:56:07 -0700 (PDT)
Message-ID: <ea4d081c-185b-4715-9b64-da1347dab28b@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 09:56:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        ath11k@lists.infradead.org, jjohnson@kernel.org,
        quic_bqiang@quicinc.com
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
 <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMCBTYWx0ZWRfX3KxATxlL/yNM 7Ft38gOCHUSLf9M5TpORMAVG6k2TkKRCn1/rF9mW4FLs24vH0RQxhkto4LloS+9bqDnMGLuZsJp MmYS9psbnF+++hXajhXRFYEO7/KSWli9HrHnEPYuKpVhN/7fgGjQOI0WswSwjuC+mfXVyRQY6M3
 bprWiKgoqPRarq3NbTLy/IQgWFicIZYLlqUzYdd0okbVACfr1iPWDXlX78U/EXjawIS0Rd8gNRj t47VHRSytXrWbj4oiYXLrWIyJ01k9ob7LD8RRVG5NoOSlph0aiXIfuGqULzqt/ogFov2NxMyOYw +PqCRQxkyXeTf3Y17hYbaHN61m1u7MhkkvqnDgJ7Z/m+8jWg7wekiHf5wTqXq+9/OgSRE7oIfK+
 GTAoTWPYr6t5oGsXKnvK5G61JWCecbMJWsZ/JcXHvN0pRuzbVwgvz8UFzIA3pb9dTwEkXUIa
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680bbea9 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=TSKuTjsm8c1mV-x-eAYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JtgaMBIUU7ZcEZePGnClaS8W60irup_v
X-Proofpoint-GUID: JtgaMBIUU7ZcEZePGnClaS8W60irup_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_095610_164982_4D24746E 
X-CRM114-Status: GOOD (  17.04  )
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

On 4/24/2025 10:37 PM, Manivannan Sadhasivam wrote:
> I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
> reserved region for the iova_start:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331

This predates my role as maintainer.
I was an internal reviewer, but in internal review (as well as the public v1)
the code was using dedicated 'qcom' DT entries and did not have an offset.

So I looked at the entire patch history:
https://lore.kernel.org/linux-wireless/?q=s%3A%22ath11k%3A+Use+reserved+host+DDR+addresses+from+DT+for+PCI+devices%22

The offset was added in v2.

There is nothing that describes why the offset was added, and nobody
questioned it.


> 
> So this means the firmware will only map the memory from reserved + 0x1000000
> for MHI data structures. But even with current implementation, the MHI stack
> doesn't know anything about the offset, because it just relies on
> dma_alloc_coherent() API which will only honor the reserved region pointed by
> 'memory' property in the node (without the offset).
> 
> So I'm not sure how the firmware makes sure that the data structures lives
> within the offset region. This is more of a question to ath11k folks.
> 
> But your series is not going to make it any worse. Sorry about the confusion.
> 
> - Mani
> 


