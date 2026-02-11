Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5F3ECD6CD
	for <ath11k@archiver.kernel.org>; Wed, 11 Feb 2026 17:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqLganMxmmc2PMqroCdlPfDvUDv9RRwtMRI8d9a+woQ=; b=SvyQeDQmdpOiwqxN0y+bnnIm9a
	+qr3dZkXpRaolwvgS8Ozbai3fBfffha1pclb1B2eaAkXDM3vaf6y0GQsPw27FdhWWKXog+IyEPEoy
	JvGY+svvNQRNQRdCz8X1IkkxhQmJJBPEdicB5CQDhzt2UTQIyyTCTKLrvUqa1agm6kKBvQ8m9+b0O
	q1SjT/4nQZ96dJbI/kAOgrkl+rpWRLbcC5vijepkBHW+7SzBw4hiOwU0DOy0IT2WsZuqyCGGSyvrN
	1iM1Wh6j3V31jIO7MCzFGaRCB87q4h5lGS/UG1bKhtuvB1smTI2eQ/i41ezWQe8hspEqt4BWzEBD6
	VxST0ufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDxj-00000000tMj-32JN;
	Wed, 11 Feb 2026 17:25:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDxh-00000000tMM-0OBC
	for ath11k@lists.infradead.org;
	Wed, 11 Feb 2026 17:25:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BBOv7t1197771
	for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 17:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqLganMxmmc2PMqroCdlPfDvUDv9RRwtMRI8d9a+woQ=; b=e8qIGn9u05qxhsDA
	wspg5evJvSDujLdnE/DfDsVkQr7+WZEc6HEcnOTU1G1B1G9coNgLiFDZZXgJ9j0n
	2oGjp3Nx0iDgSTI/xsxqrzsZFIO62tA++28MHWkYHSK9HozU8NSEOTBE3ujsISP1
	IqfiEk6NvEKRi5xYEWuaM0oIIcFXTGtbxsXW+ZBr3Ql+MfmPBfT2sTGG+a/eH5hj
	UWqAvwAO0RGV7EUGXeLbrimJZVTCyynNGClO16a4o+3EnfDQ2BQUIWWJRgPWYJdx
	giMvccCcIxb57woj9WcI7MTvHXkoXOZrcLKTcgvyUqhHmiuw2wgdkyNx8p7VZ6JN
	01Ap8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8rvb91sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 17:25:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba728aa1f9so12735015eec.0
        for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 09:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770830711; x=1771435511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mqLganMxmmc2PMqroCdlPfDvUDv9RRwtMRI8d9a+woQ=;
        b=XAdZJBG1iHk5M7WjT877+7UH44lbTVcQ7aHy8XRREU1i33klh4ss4Bd4vIkEMezO06
         l7DLCM+5T9+cMhKeAoLhBd1/7M1PXyGDKfNNxwGOPoliiT0aywJoXSDcsnmNJCnqR5kh
         3HIl0tjU7pZCp2UZ24I9QWyrluiRoY6cqcIIpV6ecX1oIDkMd7ZeCkbuZY+vvkb20f72
         jULlyvgbZdSg8tKbNuGl2CS4ulxn3rdcQ6kOVt1i7G2E9y2hJFCoqdS2l2w2SkRfzS6X
         mWpVZQuPEOlA17qFYMMj7xPeusv3oGUPUwWEx8xWOKQK39crYeImo50Mdq7jB9ECT1iC
         JWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770830711; x=1771435511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqLganMxmmc2PMqroCdlPfDvUDv9RRwtMRI8d9a+woQ=;
        b=Iu1PFCcXK2p0Y2QgeiPiVkwDuXNb2ozrI5xKKYbgHjpnzSEZbUwuF6pXDZumIeVREL
         EeZSzfg5+wDgRLou9+0ONbq3ChWDRM5bM9Fll9wvsK09OdpHh/pqY4MgkD1Ry5pEvw6X
         e/KxKHWtGE1BOPeywSBGm/CwOT2zCHKAR/rU/mxx0EZZPF9Veh0m5bj8SLT6aZEiGP+s
         aOuaCnh4G3cNgWelSHk8WGW+LeK9A2o6wj3hYR4gvaTyV73rrMNeS+dfOda1DG7Q5DXR
         Z3c8Nm3iCZNrj3prFlXR2JCLu8FB4ypkakR9lRAZeMhLUz2zAFdvNa0mwtSpRQljik/5
         knTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO5LYzjV1yv0feohpCAOR+piGCyVNnTe/FF4NpbHvD9akB2e8hth7ffUjUc77gtiTnHUBuA1M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEkiCrvhRNLj4ns00sJukv08/UiIvt6C3qDCkEV/GK5ckawUNO
	kQfijyiSxCqnIZhrU8vtopUlLZEM+aa4H7eixa2z92Tt0oThCflet7IJCJ8GpqeA9ytnztiAtn9
	vwJav/FSM4mbK6URbezxGrv3poYwejmorLfctmPcPAiSD/G/IZT4wMkfjiak/YO0n
X-Gm-Gg: AZuq6aLQhVRb2SHv0NWghoiR3FItQ8/ZirDAddQKBnXbivAmRtjQnWwaYdpwa0hT2Fq
	67FULDAHMPEzAHBO/V2BrjvvrLMqI2EVhYCMWef/Aa7WOb/sNQZj6U2b9H48KNKxvJu2QSTqkdk
	jT1MfxEMQE86nXy+DHgXQ6q43n18JcDy103X2g44T3qXmYk5s/1xlfwgGT0c7140nP37GW6CxJY
	xEm7o+x87zVyTxQk4Jdlqi9+UEAmuf6b1Z/Wp2Hi4iZcPHZDiTzan8n84nixzBEMInxdCK6SAXD
	j+4bcH6ahk+KfQXv4CmkPhFMoNDqIm4SkILB4N1u9iu7TYaoCO5zJmCGHvs5en86m8aPhzwODlm
	tDLdwH32pIw4GaVOtLoi197R8H0fL1qz8FKGx3/zEMke27vNCdu5rkN0LtQbmdEi1g5+oXbJCCA
	/gVitlmA==
X-Received: by 2002:a05:7301:1e90:b0:2b7:f44a:a688 with SMTP id 5a478bee46e88-2baa80d2cb9mr10458eec.38.1770830706227;
        Wed, 11 Feb 2026 09:25:06 -0800 (PST)
X-Received: by 2002:a05:7301:1e90:b0:2b7:f44a:a688 with SMTP id 5a478bee46e88-2baa80d2cb9mr10371eec.38.1770830702489;
        Wed, 11 Feb 2026 09:25:02 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcfe6b7sm2116837eec.29.2026.02.11.09.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 09:25:01 -0800 (PST)
Message-ID: <e7f2d5e9-fc49-44b2-be0b-f56d830953c8@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 09:25:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: QCA6390 hw2.0: Add bdf for Xiaomi Pad 5 Pro 5G
To: Dawid Wrobel <me@dawidwrobel.com>, ath11k@lists.infradead.org
References: <CANO8mVL7vevY7QyM0xxcmeS_QCLit6WHW-WPZnMqhh9OsQVUSQ@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CANO8mVL7vevY7QyM0xxcmeS_QCLit6WHW-WPZnMqhh9OsQVUSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+XWAuYi c=1 sm=1 tr=0 ts=698cbb77 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=JSMnERB7_5VUQYc0t-UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEzNCBTYWx0ZWRfX5Jc8FtWqxcDs
 rHL7GnTekNwSwO1jERfTElcRPrjef6Gg6qF25Ky711o9so5YUqfTEGTke8oPxsjlP9hLLnxotk6
 Xg2bmKNXerjdnRUakVYwz/6a6GYMVa+6SMraidTQI5u109MgCnCu8lO1WWBmHbYXmzQGNfqmmjE
 qywkrKPXrtqBs8EYXsS7qScL9QhK4d/aePWqdnxj9FooOsCxBL/03jPI3Sd536sq5L3Xy9XwfCg
 nDP/xlgYNCpFF46h/0lSohtxIkUEKndCqDb88Bwf1LxDt0oxX+FLYO3VZ9I72nAgZYzOG32R82u
 4TacXXnOGh0mv8a2AFlbiyCtY0P5vHGZQH/3jQflHDyKt1lGLyM2fsMG6OPCUT+6i4JW1XVmFcl
 EGsBxW1pCfJdRvTfJ55xfqbiBSPHY5NKQJxwve72qpNJMGelltq5xwCPkiKSRe0UZpg24ReYI0h
 YOWAfY81saWUxu+hMBw==
X-Proofpoint-GUID: 6m8Mb1IEEUFdLH24S1wpM8fJ-tWybsLO
X-Proofpoint-ORIG-GUID: 6m8Mb1IEEUFdLH24S1wpM8fJ-tWybsLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_092513_271447_7CEC8ECB 
X-CRM114-Status: GOOD (  12.51  )
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

On 10/30/2025 4:03 PM, Dawid Wrobel wrote:
> Add bdf for Xiaomi Pad 5 Pro 5G, running the mainline kernel.
> 
> * description for what hardware this is:
> 
>  - it is a SM8250 based board
>  - uses QCA6390 as wlan module
>  - similar to Xiaomi Pad 5 Pro (non-5G)
> 
> * origin of the board file (did you create it yourself or where you
>  downloaded)
> 
>  - taken from the stock 1.0.3.0.TKZCNXM_13.0 firmware image
> 
> * ids to be used with the board file
>   Board is:
>        QCA6390 hw2.0
>   ID:
>        bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Xiaomi_Pad_5Pro_5G
>   sha256sum:
>        d982af0adc4501d199956e627a5000e8ca638e1061f8c932c41860922f8ff6a9
> 
> * attach the actual board file (board.bin)
>        bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Xiaomi_Pad_5Pro_5G.bin
> 
> P.S. I somehow managed to have GMail send my previous mail as HTML —
> despite told not to — which bounced off this ML but not
> linux-wireless@vger.kernel.org. I’m resending it here in plain text.
> My apologies.
> 

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/235d09a5e111cc9e78eab4e00e5e5ebdc9fad4c6

