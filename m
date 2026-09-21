Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7885DC982DA
	for <ath11k@archiver.kernel.org>; Mon, 21 Sep 2026 03:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYt8LOSON/JsGZ2ak1N5nI/Npl3t37NWkKDiiRq/YtA=; b=B7QNA/Ay6M2PF74bMqHVwGGydz
	nJPpQVhW2kxdOUuRgweo0L2MUJlgtkYupv53Lxhe8ypilJJJ47fhI25c0Hvct6Blp8ebm3QFypxUt
	A+TtMXf8O1XkDdKh+L6L+QdAAgMYgFLLBa/jEedBzTvPGl96SHdREMV+5xv+XT6WbuuY3Ip80U3mT
	+qLN3TUOaO+FNFWXG7CSwIRNaN8fOc3wULX2OAqT3nyMSZSvHc6+6S8L+UmtCxd02N33dqzTquuy7
	vpmkdMenCZTdFVqDkQmtUCB87TL3IVvufI0b9+YyljzlNtsCH1eaukR0aQRq6kOEOs1FpjkXEwaQn
	Waa3rAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UWt-00000000l7q-2RdV;
	Mon, 21 Sep 2026 03:17:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UWq-00000000l7H-29VB
	for ath11k@lists.infradead.org;
	Mon, 21 Sep 2026 03:17:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L0kioV130836
	for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 03:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cYt8LOSON/JsGZ2ak1N5nI/Npl3t37NWkKDiiRq/YtA=; b=YrsXGJtze1bTtQjB
	54fIcsSgtaQbQAhttkwdDJ/7E3ussqxqXEr17889ChwyvuW7nNRWM16F/uDa5qku
	D9PpwPoiaTM+PngooLSiL9vH9ublSb/Lijfcx4lqWSmy+Su9udPzAaJIG58Qfu4T
	wX0n2lWMn1F4DTpNrjXvF0iIkijZB809iVRkY/v2hevYBIWIGY0DFzBHdidgiC2f
	EtzbKYai4s8/Mgt+71/XWMgVYuGHy4m9QMndKXmKO9fLeqOh3eh3j5ZG6ro6T/gr
	/KehjtVNYQ4jLQBNX7DUr7b7ycKhG/5jtmYa16nz7QwYZYfohyA5PDDgATjc/wLW
	iiQ5JQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq7j8nfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 21 Sep 2026 03:17:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3409156a12.0
        for <ath11k@lists.infradead.org>; Sun, 20 Sep 2026 20:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789960633; x=1790565433; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYt8LOSON/JsGZ2ak1N5nI/Npl3t37NWkKDiiRq/YtA=;
        b=F9keS4UYRAKrCR/ywzhz1PNU9uhATBmz5medanBvfbTKlftC3vgpxFWSHy4KhN73Pr
         Hk5sNuYke4mO3WJEfxAqgXhCIHMmG8QvKl7+s+3Iami3+2vkblKxgi4W5W/OVVTqsPFR
         2ar3QAbXTI+5DxKOXi5RQ/fn7hk3rr72dFIVqKUlTD8N6+r4lhuSfCr1EAZljHNOdnCR
         W86BkaWgrvGHsfw+1+jZDudmCMLpiouQvGobJ2NGVN7oFe+XmQ/EKooqKBJ32fqg8tDz
         eSGOr/6Ab7X8DyEl7LuOhAaGU7u/IF96wftGWNIgpCFHzN72Nq8MknlwfI/lCZrROstb
         adZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789960633; x=1790565433;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYt8LOSON/JsGZ2ak1N5nI/Npl3t37NWkKDiiRq/YtA=;
        b=rDxjBBw3+kvsQRW2t60wZls16PleXfmwWI123yKSqGRn4Dq3KnCH/+TwWCZJC4xvI1
         ZFbC2h1qs9D72LHk2BcEd73RjRY/SVEBRsBNCOFPxE8RYJh4idhbp5ur9aadaELrhZ9d
         ueOoyPo8BKPLM6U090ghlVlfQiu+lPY12rl5y0sO6iAaBD/PmZ/UktBtyvLTb+6fh+Nw
         9kOm3pF2clFnean8ICF7nQpqdOJXWu1nIJX8TUIB1AFpOTzAuHMywP6uUFNwhGSbM7Jf
         JZPP/yv+0T8r0lmRInaWiFAg8DZKgH3P7LPLBeYWM63rOf0iRFAu69wn5F3WmTpgyi3a
         ptpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSKWTgsV+pfiS74ndBYoCu0XfpvDYgEUJDj0wsLKLi+azHD5QtLXpE1wffLXlQ3ymf/+twQDA=@lists.infradead.org
X-Gm-Message-State: AFuF++nsW3N1Dv3qLl+lWkmGQ+no+kts40UGUxYvqEVvMi1+q0qiDBys
	GadRItyWN4SYVEzUriKbY2p9XbQ4vPT63QhHPt1FY2k8aA3ES1QKPlPBweoO/qff7L5S6Ms/mbk
	OdQw5qsqwazGeZE4vFuH6d4n183YqQgzwa5z1t2134Jb6elDbcyMGcqTHAtZd8yIr
X-Gm-Gg: AYBFou33s6Jsw4VbzZKA5hDG97Jquz+NCRLVLhb83MEgq++H3KbV95D9Rq5xB2FOMkb
	mZH7V/u/Op9s+7zo/zKMEmGkHeaJWAQZz9QqzMqJuCYE6Lf8vxS9ZbdlJfuokS2eho7mWEtTcMN
	N4BQrF6bhXYTH9IYP9HYo7+k0QdIRc35vXj8KtmbSHrOoIZCyhtDBp2nh3umDdMCNG3RH2GgMGs
	EmIZSOxDZ66ni6ZVw6JDDz3RVMTKvmD/zdf8M2tm2bccoh9qlst7XH4ky8FhzilTy2zXjL71Awx
	8rRh38txHoXVBaFV6i5EMyqwTKMLoWAau9zPQWOgqAgQHo+tVnBDoaJCRarFWJM/+8GPxmXBkSU
	Cd/Fcvt9iAB2bHIIiEG8cJcRj89sFjUacclzHLquBPNrTFGMaRlAXX2nrE5tjTaXo3OYmHDMD
X-Received: by 2002:a05:6a20:a10f:b0:3dd:a196:5392 with SMTP id adf61e73a8af0-3dda1965441mr9479664637.52.1789960633200;
        Sun, 20 Sep 2026 20:17:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10f:b0:3dd:a196:5392 with SMTP id adf61e73a8af0-3dda1965441mr9479640637.52.1789960632788;
        Sun, 20 Sep 2026 20:17:12 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aed5c05sm2662578a12.22.2026.09.20.20.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 20:17:12 -0700 (PDT)
Message-ID: <358d7dd0-20b0-44ee-8b1e-a0cc6cb40abe@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:17:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de>
 <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com>
 <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
 <10491411-b500-4e89-bf85-5142ced60aaf@samsung.com>
 <CAC1t37Ltrh+BBaEPi8grXnMrDt3qGDH8BA56av-h7=yPCCk0Nw@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAC1t37Ltrh+BBaEPi8grXnMrDt3qGDH8BA56av-h7=yPCCk0Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HIZWhYtv c=1 sm=1 tr=0 ts=6ab0a1ba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=19USHdIQmY6s7t-heMEA:9 a=QEXdDO2ut3YA:10 a=D25mL4rx1t8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA0MyBTYWx0ZWRfX/65uI1larXZK
 G13K5p7LbNqO+NytKcqR/VfD64PuNugQGifWZhxl1lM5RC0XdgbsBiHk/IO03i/yRH+0KjBAAJO
 X2y2va8paTTndEVeg0UdUnO7nh9sVbw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA0MyBTYWx0ZWRfXzUOJb/wjeOCG
 8y2GIOSaqqvIFHDZHhtnBVm15f1fIjaMPv5A+EhmRaUoWIUi18aP1wkYuwxcofjU2kTYqTIVB1L
 XdyrWENh2Exkvm7oR6kzBQll2z0V9ulU4AqIlz3vvqiiFtnKu7h5CDDvru+jmRMna1gsDSl/Bb9
 SvEy0HAbxGNU6/1RVfdLqnkXdYDEBN/JG5m1Uvt8/9dX+YqXxnDtPNIcwd9O+95GXQjiNs3XDsS
 jdN9cRJuBwDxwA48wjZYoceZOlLGR8XO0RkYu3apZH0UowTZZr/UoRZ2959aletRCYvWUGaIL2n
 TCLWhiitC4f1BTFK48RYINKEz2XlqS8DDSzoihkj1iHxlchb+4jcVF/P+nSszQbM8HdJeice+PT
 1W2OI/gmLeDLwbriLB4K2KG5FoPr208+0GYLfMJGFS63bBjPF9wZzzxocZ3sEOf96eEnxl7Te21
 3zJG0uJ/QUIHT28r50Q==
X-Proofpoint-ORIG-GUID: SISsO76Of-4feYND51AEwKGF99KnJZYQ
X-Proofpoint-GUID: SISsO76Of-4feYND51AEwKGF99KnJZYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_201716_705579_BA45F7BA 
X-CRM114-Status: UNSURE (   7.38  )
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



On 9/21/2026 12:42 AM, Julius Bairaktaris wrote:
> Hi @Baochen,
> 
> tested 5 times and it solves the problem. Thanks!

Thanks. Can I have below tag when I submit the fix ?

Tested-by: Julius Bairaktaris <julius@bairaktaris.de>

