Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A2B606A31A
	for <ath11k@archiver.kernel.org>; Sat, 31 Oct 2026 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vF99+Ypy;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mTypWbyE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tx0K9WJB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=; b=vF99+YpyY+rx3BUH7tBoSBUqNY
	kN4L+8sH+wg2w2Vda+c2WaXdBAs8S7Pwvq/n5HqbDu/TSi+rnBNAyXqAj1xr2azOdAdUWpvqiquqp
	JDIv1A8XFN0vuESec04dXN0iqq1JRIbuUhhiB81+kTP2FE5dYLG/kPinn1gLbkHImSZocEoyz9S1h
	S7fi85DvMbnjv/JfVkMDjncUwsL49ATt+jJLmNCMxVzQ4FGcowv7glvl3yTY1aYwmEXh+WxTRK2/i
	6hdOsH5qKVb3tyawAddrkXOZzGklqQm0QXoMZI4wop94mYoQ3bqFc7Ww7EFztvVPaJvWarAG1bWAs
	QF8b4LCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFmB-0000000DfWW-1k5r;
	Sat, 31 Oct 2026 20:34:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNFm8-0000000DfV0-243V
	for ath11k@lists.infradead.org;
	Sat, 31 Oct 2026 20:34:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJEuPr2613999
	for <ath11k@lists.infradead.org>; Sat, 31 Oct 2026 20:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1+4nnRf1i9Xkva61km0GKad
	iZZAe35/Fj/lxJjaKFk=; b=mTypWbyE7DNC25uq4Dl6xeMo/Wx5jLwWIV0BytVx
	G0YT3XnJVaVbuSKO937sS06Q9/NSvafcz/5UA1nrevHRY7V6n4I2hN/bHQNh4FSO
	EvEebdai5EEdnDT5G65XUyRGhuYf+3BzcFQNMIycpiTdfR9YTUik5lydlj1Df1Za
	NPteg5GgkUqUs0kRh/Ay1uZnhZAR+Nhx7SEuEc8lhAiYsfOvmBSA7epWt/FdLxFk
	VBwk6Vokpp2VrFA7lS1OCWsTNh1RfN4sNm7TptOW4UADQkhrExoohoeLVijd5rZU
	BTHNh3tOO45ANwInxiSrgmoIXP0LX6ehQYlM44ghSDOAhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nft46h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 31 Oct 2026 20:34:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso395826885a.3
        for <ath11k@lists.infradead.org>; Sat, 31 Oct 2026 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478843; x=1794083643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=;
        b=Tx0K9WJByNW8iHBXfpzxxv3puZTmUiazE9ZJNpBF4RmOxPLVxjmlAh3iS5g98KQqEs
         ofnUJNtb8YqUUPbxok8wfWgEPXCF0a7IfgCChEvHwE3mrvaWoEXQX1EiL/Tiko6mse0j
         w9Mj7yZnD45G7B5lzge6baZdMGWYCEOEKeaalFQTJUC3scj8ujY+stoit9hJj+lbhWH5
         fd0+9UpDRVaZT89ww+FgwVtkHmQ7Tt+4u2GCRDcuxavX4xi40u00ODXYWlv1MeIuBzDK
         /ItQdch/4OjW2D7rytQQXahGRfClzUdWuLG5TdxWdfq6PevkOjv67lwSNN9LNt0UrdZT
         QVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478843; x=1794083643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1+4nnRf1i9Xkva61km0GKadiZZAe35/Fj/lxJjaKFk=;
        b=CmikM7y0OqJPuboBHimVWX2/v/aVqvkkvZdyr3lS+chZnZih0NuEisJqeYb0FidLaC
         dIZjam4qGmqLh4o12AZeKv6nciIr7bwy92VlaRL92HhESMItVJnz//DQwRxshqsG1hwd
         FMejnYVF6jfqu5cvGh8cIM6biziRl2L2JBqGEOB9mS1QjcKb9bsaxvFtg7iW9G0kaoIb
         BSu89Sla+2TbPfiWdQ545szPTTaQdaH7S6h3ZJ4tQYReCv0XgyjsK33B4VpC3Phx7wC5
         iC/hRvHKJcxg/0zEqAOg9cYypbnuGRrrW0M9bSc02z2522sLZNV5VjYssdMQ5MAq9hUd
         8hiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrv6b8j+9NqBe+VbloIlJ+YKSveAsxmHbeUsETdPWUW0zwjRLrFAseeMFUB7uwvoxmP8w6QIA=@lists.infradead.org
X-Gm-Message-State: AFq9FYKuCGc5Mk6nuyvwG3BE0v+NOJWEpReBEJB2+9B9wWbne9iJf139
	zFt7l6qADjTKYT9qHLFlpL2rfgMjBW4mzSjDd//7M5zYak2DWluKc9khgZRgswVaZSqU7Spd8by
	+n33sLfHuloPjoRw/V3sJLOWk6kQ5H6bdmNl/rv8ldlvjLN7RDcxHuT9Fw3VxIZv5
X-Gm-Gg: AYBFou37wBork96ncxPBqDIBPax2j9Sp6W2tTDLHuXUkDltGGaE3Zw9GiJK40I1luQU
	AxBegZ96NS4udksI8UM+oY7wtkOoNXcx4UK+TzxjAqRs3NPCMpJQj11AUQLH8KND5JFv04Q+s7T
	G5zaHovRSp+aHnt9f7erynrZ/jQOuFybFroNss3IMF9McYCfVFlUkFo++Xui6tb+F0coB8XXSFl
	1pzjnfCqKVLVJ02pynjUH7/lINgBebq8OxNPQ8PibbXu1zVWhVhWR2C7o70ofrNKpP4m4lQtB6X
	XzTMKnQ15lK3bHsQP5j8oDAEhoUQwiCFKMfB1oiT8EZAB6WH3JqLlz0JcpNdM9E8WM2p+8Ls9AO
	AZYlUyxTcHSK1nB5TWzBe16V+l6NkVUL2AO7aSWSRHQqDs2RQVveM8UJMBDEPL2tbrtABHA6mNa
	qaXPStsaqgh73SO0ksssOwbICpmd1ZfUcaQYLo/FVGVp3yDEdQXyB9zoWTobx8DQ==
X-Received: by 2002:a05:620a:2b43:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94421799380mr994235185a.32.1793478842787;
        Sat, 31 Oct 2026 13:34:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2b43:b0:93e:fb96:68f5 with SMTP id af79cd13be357-94421799380mr994232685a.32.1793478842281;
        Sat, 31 Oct 2026 13:34:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd67sm782750e87.12.2026.10.31.13.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:34:00 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:33:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261029
Message-ID: <bfx5k2tljdl4rijelpcwgrsdvk26hf7ajv7pc5o2db73m5sgxl@72mzxbxhgzfh>
References: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX1x0D1ZFaRs9M
 hr0OTEKU3802YDlzabIHXY5HnEobLflb7N8cX/Ezro1JovpJLKywObIby3vhf/eEjDXikOVYSLG
 aJbtsV906RjyhLWWmkOKOTMlT6vmGNI=
X-Proofpoint-GUID: yK6XazUD1Z_JWx_M-wc0JgMq9fvKps_P
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae650bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=LW1wpjZNjeFz3wEaO24A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yK6XazUD1Z_JWx_M-wc0JgMq9fvKps_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX5FCUJCzBFV5N
 SNN4VV7pLXkmi3JJY+8bnKl+rdeAC9DZ/xPYaPpM8suTTam4WzUzKefYHVbhReRrJ9QNMqSOgFx
 Ve9c/c05ncRmTh6UVfL58MER2UMJgJBDL2OxCNLTBTOafCYuN1fsGBKys59WSTDynNFuu7p1RKu
 G8KOXD3edzuouL2avmvZonsIYiCWG8pryNPt96mveHj19WnBUTGby0+liJnHENHItpPhw0Y+5do
 nmvJvVo98Dj1KHLCtXKGyCDQjULU5m6Xh8/RM0LJsdtlZXE6qBrpTGoH2TGBV60xNPSIMEN3q1J
 hhVTUAQIRBeGRCquuxS7nDR4O7t9LsCSn8hR+3b+w81jOSLkLEPGmvg+BQW4h1C2+vc8hSqPyel
 oaE10kXGvktOPxmPFCm6FFYxIc9UTTjXkrV1XG3iaqRZQpRypR45N7zkX5dVTF53XpSwrzoolMH
 YPOz92brYCGjf2EqvMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_133404_644854_1DFE5F81 
X-CRM114-Status: GOOD (  11.70  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:21:43AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k and ath12k.
> 
> For ath11k, add IOT-focused NFA725(with QCA2066) firmware and board file.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1343

> 
> Please let me know if there are any problems.

-- 
With best wishes
Dmitry

