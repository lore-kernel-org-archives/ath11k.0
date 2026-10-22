Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0477606A31A
	for <ath11k@archiver.kernel.org>; Thu, 22 Oct 2026 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xXcIgNeA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e9yYA3fe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPDW4XVt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=; b=xXcIgNeAB1CamX
	+WDXAmAmYUk7d5LaJ4d5zr1h94APiDyQP0hnBRYI9BlK6/y02vtowJ68Ai6GaSaKx9ctdFeTY4MPB
	BNMfv7RlLNDMWrLWOLTJd/OscWE34Tm8Mf44hHWg/oMfbBbgMZJLeEIgHWWdHOfqnp6Z6nsDNExoB
	Zk7eBPWB+MYb4AlgMqKRsg/EflfsUsL7apgIRdGftjlwW/XJdn+EyR3rd8hX0XGEm9XPPGq3xavmm
	4Iu6FWGL0dUF3OrMq0xp0W2ast+zSRPpoKGZhSQbr+ETUtcrYsS1omsSswYCq99ZK0+smoPf4YYPB
	58c/mHInjfJlB92jKMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwww-0000000EeQw-1KUA;
	Thu, 22 Oct 2026 17:51:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwwt-0000000EeOm-3KU0
	for ath11k@lists.infradead.org;
	Thu, 22 Oct 2026 17:51:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFDQt978806
	for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 17:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=; b=e9yYA3fe62mQ9SMv
	109TOAt2CaqagWfmRDafkPSXpaLh2XDwuoUibLZdVQ+DkDKoA1SYJQ5FvdOg4/jc
	gNHJjKENO9niTiRXo/efRTzbItq5KivpAQ4eKkB3K7ZxdyanwGu0ZQ42oL1aVsF/
	ridKCBUZJUuvqnJ1kUi1L189hdgBXjLMCGtQTL+lXaWtGG2NhhFAHdOgivosBhST
	zXVuH8C/Ia1bkr8c/nZsQMxKZYVSrlyq8864YuO3m4bcM6tAEic+X9Kyn1rO2qo5
	0GPeztI6ElRoJAbhsbVcuvGD1gEuO//YA4Kl5a0NyYwlzTuShRKpu7r3EATaAdLV
	U/x1IA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93dct4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 17:51:31 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-18eb2616974so11318c88.1
        for <ath11k@lists.infradead.org>; Thu, 22 Oct 2026 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792691491; x=1793296291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
        b=FPDW4XVttS8fgbEqGd2kmz2ck8KNetuaBUlcIa+xqDG5uzpc2pHfKe+OYa/0MCb3cH
         JBEscSdMXbo/0RWnETwRpFym3N86xmIa/FwwJyraDPxkbZkzjSHL2SaVVRGxUeuCgomJ
         P9HkfryB7j/jcVNq+SkWqpJgaJxB8HbaNhV+xC01EquatrSgoAuxzNlUKKGoEEEtgX25
         mIg0//uWBeoYaIygwoR2HAPQmlj7nd6MOMumHWPwywUdRLXeHSWmQPghWHkRaxuyoSyc
         N5J/KB3UmxE1fa6egT0aVMH8gJeo/BM4lFhdlDCbezhshZoz+jRC1aSCe2YTmsQFH6eD
         gU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691491; x=1793296291;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9mXOpeYpIk8OzuCjqjaf3ach7LHr2UJsWfRjycnpd4=;
        b=UGcnq3+35Pt2Yo2cjFbMhUib30boLioQU+DaH8gemsI26cWTmWP2WsOUrZymwLmCKq
         9DCy737wyu3EHxZ4v7ZNutmiARz07IhZ2BsBuMHcMcYWFow+EvP5b41wwgRGbMdY08Lc
         En5MDoAQM6ztdY7lx143jjeO5NbQ2QKpK4LIyCN2PSzyRkqyuVdGFByDg0e2KSPxHbU8
         CNzAE2Fv6SLcMe7yVnfi9QJVmuvUbfPQOwItCfQ9jEtr1c7+MAT8pT9dB4RQ+O8Ou8LU
         A0/oOegjuyQ8aORaI3dB/r5oQwXzpNRwHY055fmQE1PHdAC4WwR6k7kvs3lScY9idVpQ
         dgfw==
X-Forwarded-Encrypted: i=1; AKwUvBx3yw2pnej4wrllMeM/Ur/kw53S4jlsM4um9sTGKKoV78OQF8qFmJo0dY3ASM5uNUkzFjsYdis=@lists.infradead.org
X-Gm-Message-State: AFq9FYICQihRte9HtWzzUCtpnxLcr29keSRovWNipRS4ulCwBz3zY0XI
	j3Snq2C5N6Y0TbxbkLsSDfZgy8n6WXA1lz8a1IIw5zuaewdfwKGYRppsE0GBSGLgT0z5q+Ej/e4
	J07rOAvQjodPinUMasFZeEBjGkYktSaZaWh5VBLdXBfKZCJyWV/FtXj+09X2X33ADkdGEmNkP
X-Gm-Gg: AYBFou28RCyaRW0/85XMImjZu4Cq9peD/lYSVDU3sdBckqUN326lKbdCc4gu7w8oxMH
	WJNua6GupyGZuWdqPv2/8x15ddMTLfrTG1kvs30fanejLXpH5ArLpfC7zwKEwZLZoR0ueG4MZV/
	InOVd2XLQf1Pfv3N9K6r0jo5gjs9iCLfdszg/NklC7i6F3F6uxrqxAmkAz/KPrLwWLXAQtxhshw
	aIXE90iCbaCXQoXIhG0JQ8Lh9Vrk1l9DRABhIGquJTHFfjQAspQFwHgdY+RPJSEi52IZ4q/2+sF
	nnDHdsT7b7CWWVV7pDfdPoo8g+NvglcggU/RTe+EO8uT8rYGdRmleNfAgcqqyVw4Mp9BGi+MRgh
	kYmW+cxHeYbCHIHk2dVmGAAOa2J47LditVeLCu+l6SA8GjIDW11cLrl2H7Q==
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr244422c88.37.1792691490529;
        Thu, 22 Oct 2026 10:51:30 -0700 (PDT)
X-Received: by 2002:a05:7023:a81:b0:168:3243:c911 with SMTP id a92af1059eb24-195a0effa19mr243809c88.37.1792691481288;
        Thu, 22 Oct 2026 10:51:21 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195aa59ab33sm140790c88.19.2026.10.22.10.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:51:20 -0700 (PDT)
Message-ID: <db682798-07c2-467f-809b-693615b9dcb8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:51:18 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20261021
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <51c9bb4a-e86f-47b3-96a0-38288b460bcb@oss.qualcomm.com>
 <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tnbl77vafrjvgfyryd4zfyr2o5myg3vg744zglzitnpxpt2uoh@wejrgjjcbfzi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX9v/17pHP29f8
 yuRtPpwdD/R70t8OMNo94haOACW7LUyBfdRWDfKSW74bPXtn8iXmB+oti6jHHP/Dv4qL79tNI49
 LuFetPe2VO8HcnjXpM2Rg2I3+SZCieE=
X-Proofpoint-ORIG-GUID: P1BT5hMQmvlH9w-wyXgw0lg0iydrNwoH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfXze+YYR5n6WIf
 BEJRId/lIqe32P8pLCG7PWSW8dnpPlPoYThh1rH6GM9RGHaPOtWzXsYyvdtCU3T4iUFgVnZn6gp
 YsrOjRLd/UriVsE4zO31D6V1kkiI19b3RmAdLxm34bPPCVyhH/96HQxhVFjwNGz7/HWfzJQJ1Fk
 GBhrVuWyFrszUaXjlL1wbS1LD5xRxbFKeUD7UOGB8pHKuk4x8KGiJ71LtcM0jebODknKNA+gXFb
 b1oB0YOMy8VHNSETrMFEkJQDTZPAMVoWdtjP5BAtrrgXJJ8krKFVDv3+7OlYZR0LOnKICkg9Wlf
 DgEUzKC2x4gUoouCxDg7ZJraqlfkUV3uSmOMFQO1WO9WvY4oxdATwIR1z/s6BeB3g2tImljbMLe
 Rbgz040VyzXGUUl8Sl6SZxM+8sZ5tI6f9Y1CQZ0/hMK+FEvJl8+h8jWsoHxEsmnbzhHGvHYyuaP
 kSUfNUFjUGrLQ2wPQ6g==
X-Proofpoint-GUID: P1BT5hMQmvlH9w-wyXgw0lg0iydrNwoH
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ada4d23 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8cXpSGzgMJdWOUynBhUA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_105131_880139_5288A2DB 
X-CRM114-Status: GOOD (  10.74  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/2026 9:49 AM, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 09:30:17AM -0700, Jeff Johnson wrote:
>> Hi,
>> Here's a new pull request for ath10k, ath11k and ath12k firmware.
>>
>> There are no changes for ath11k or ath12k.
>>
>> For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.
>>
>> Please let me know if there are any problems.
> 
> "make check" failed:
> 
> 1. Missing "Signed-off-by: author information"
ACK, please drop. Updated PR issued.

/jeff

