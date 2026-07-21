Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E36AC4452D
	for <ath11k@archiver.kernel.org>; Tue, 21 Jul 2026 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7HDa8lD442gBovq8r187WVDYGAUCBh/WDBaT8jv9G8=; b=BVzPKleZQ0l8PHiAhzhF2qJAlL
	1jvvhTEJBwyx3gWawmDz2WeVDAwpjjrBJ91MoICSFbS8BkKxlB86ACTdvm15IfznTlKg5tMeSr4a4
	TF5/9GzS+00sZOmJUW1Fsd0evZieBr95u+ECKbn0AEViUh8cM5Qyki3BKbm/c4P1Ag4P5D1gSrRQs
	Hs7rPdEUhm+I8PA9o4dBY4LbMWBa+5hAymtB5TVw8ABoRXJfua1+Q6FyzqGkix291DfKBj2z/YbO9
	hc5TLMWwbP2of6dG5KDtoIqao4E8jh19Gkl5fJDJFeXqMVHq3I0lI//vDjEiFsTCnChsbHbYyFkSF
	seHzZSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGfd-0000000AKsK-4Am8;
	Tue, 21 Jul 2026 20:02:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGfb-0000000AKqf-39AG
	for ath11k@lists.infradead.org;
	Tue, 21 Jul 2026 20:02:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRM7o2376854
	for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 20:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7HDa8lD442gBovq8r187WVDYGAUCBh/WDBaT8jv9G8=; b=Be/EUH4S4qWblnhv
	GjAF2JziCJuFE/iSFIhJEzXdfRQ1OJsVeE0WDcroUwXQlgnoeAlUTdPIm27IKFs1
	9PA26QKMzk3s7kTadNKf6oIzpYnCvoUlFfdUIPFm/bPtyJJo7B1E/+bzdKiXblbS
	GY09yP0nq0mjDZM7ham5QyOWMWlBQ5USwzJkqnEtiGLVruMr4OAE7YTCBD5CTQKC
	DC9CrEofxqZXl+4yc4diXVZvSC43XuinR6KbNTFA2igUvlYay6+6eHh/DxLVbaV2
	RdszfKFtsxTywv4FDLy0TcWA8ocQSANjxrXax9zDKaUudJY47qrwobB6kjNUpnZK
	qAmMUw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a8nt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 20:02:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so17914091a12.3
        for <ath11k@lists.infradead.org>; Tue, 21 Jul 2026 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784664146; x=1785268946; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7HDa8lD442gBovq8r187WVDYGAUCBh/WDBaT8jv9G8=;
        b=LM64YWFub9LCCU/ZqUCvZ/sTZjDE8asFSjtp/yc/69zjmug+H/iZsiPke0KV8GNfQc
         T/OYOlK3AClavypnexfg4vMegah4ZlmkQgGI8oGXMBDONw46TEiUgzScKY57xI2OuZdt
         f7ZLYMzurY6QmnTgfENRnmFnCF0I/qO4YM2qFGwqvQECkBxPtBfJYeUk4q47kzdrFDV9
         KPSfGXDaQBHCBNiKME70/fNNeeTf4NjZq23h+kwEMbrjibN0TClLfkp8F2XaXHuJzjbc
         +0cAsN/g3gpMFl1rtRGr7S/Sd8rL1dmHhYQbu3rK9oY1ycPUjoU28/YGJFDyejpWS47a
         pZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784664146; x=1785268946;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7HDa8lD442gBovq8r187WVDYGAUCBh/WDBaT8jv9G8=;
        b=Ab4mkHgU87UBPD8CXothfU4y8trFebTMcWV8+vk1HFNUm8Xo2/Mx6lSogP2LiSCdSp
         4lcDFM/uM2+jCro9K3XAP1ouqLwy0IbUIQ5Y5nhA8gXoX68oTQCwkXKr4HckjTYSJp5a
         0H/6arv9bP4Ugxd4B/9HeOdIbFOOHtZ9gnZ7IM7FcjgCml/pb3mpnylQePq7J1nLlVvL
         QqrQK4lMuOabqbTjNJ1MBBKxZyTITDlYRMWcA3whmj2Du26nmghiUnVUfUXQQsVZGsk1
         q2YSyswBbOu7Dc3GTRUTWjS3RkxZ5qiCzACIlPZgTApnj1Rgrm6QMA66iGILBjyK5f+F
         8rYA==
X-Forwarded-Encrypted: i=1; AHgh+RqmSN60XgkazTBlGlJqac9nXsmL5h0C/CwN5WlBV3L8+USZDSjkB7GW91baEAFzHApAd+5CTJg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ+insY7idIzmU74kleQW9Zc0UTOZcfblOIaE4+sdM4aKzZf1a
	tV4bQfpbKPN1HX9LGpoS61ZF0QcGqhFcjmzcQq8FW1G2xXUJY8o9H04PIzM/h2Bj9YswIqFN/Mw
	3RBi4HHm0pv30Ioa2kQ0vcZ+6JNPl0htlAXk7QraKNMV6lo0yJTCQO5u8EsDeNit9gvqzGqHf
X-Gm-Gg: AR+sD11tvIEwx088knRSXFPrFQIYFh2Ru3POj/ITI2STqnoS9pO4JkPxiOPRs8HOaqs
	kQYXXm630bxL3ammd6A4O26M+koLxl3Cgn25TuQXhlatI0xrkEiFBsJrABPSZQd+oPA6mTU8MXW
	RhWgtM+/u/cqUXTYDJE7KaumuqdYti27FsLJKuddpm7BwxBrqP0J9K3npf6n4J3mo3M4mwH0i4N
	tQpkh/qO8PjTSagXGJ53uTZlYPiEWL/MoR8U7DkCJtUu4uffvzNsTg535jWhVWf+HN/ECz5727u
	viDbf321MG+T2D7UFqf1OGPhO+raeomPg+M1dTS/9LnClda1CPNrFK4InE3p2WksHfEIMbt18a8
	bYtK0pMF2j078gSftzpOPtf4ERgy5vwZtuw7PgolVOCfD5LnVjTxa58k=
X-Received: by 2002:a05:6a21:d8c:b0:3c3:91f5:82cf with SMTP id adf61e73a8af0-3c3ad94bb70mr22036494637.46.1784664145653;
        Tue, 21 Jul 2026 13:02:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:d8c:b0:3c3:91f5:82cf with SMTP id adf61e73a8af0-3c3ad94bb70mr22036455637.46.1784664145232;
        Tue, 21 Jul 2026 13:02:25 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm1574958eec.3.2026.07.21.13.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:02:22 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260716-ath11k_wmi_tlv_op_rx-overread-v1-1-0b972b3f1368@oss.qualcomm.com>
References: <20260716-ath11k_wmi_tlv_op_rx-overread-v1-1-0b972b3f1368@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: Avoid buffer overread in
 ath11k_wmi_tlv_op_rx()
Message-Id: <178466414265.1747165.16576801380148077440.b4-ty@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:02:22 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwOCBTYWx0ZWRfX3tYCMhnlnMvU
 rdThTrIM/yxweO6liWr7Gv37zPOYNxxkink6SG4DZZ/XrrleMF7efHLWYo5aQSGqrfJM/YB1zuF
 OJfjiB32jSJa5wc+1+IhFLKVMWODxKy+sixVmCkOV0nTqWnCuiV3AaoDRCklp94fhsTuFzpdaQP
 4Qxsv1OwStj98Hs0uk+yz/V2caye8hCPX40J0AiolybBJvyMbeCyfqUT0F+MN+rgkd4wqh80PES
 h6mI4g4V24t/ta5XD14G44QFgbHtkGD0N89WVTGVo0mBx2JtMhbLZNpd3temtJqaJmraG22T2yQ
 xhShP84hGqQ2K9lFpOgbc9jX/pA8EptgmLOG0eErD0wEpUuxLbrA9ESGGO9etBISbCaGvrSNv9E
 ArBYd9qWCt402hN4v9ICcz3vbHQg5/z6ntrbmZEZqTMJPDqIXNev6JczBFZ67nCkCY4gatJ7I7Q
 cirq9gBiR0a2PJxpbQw==
X-Proofpoint-GUID: _kKV_xs178vaQeO0h5t_IF7sH4Vegk6E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwOCBTYWx0ZWRfX2PeqKr3EPG5r
 b2xdKS5e5szxry48PQUED6DfOq4X3aebseLe4tr22N4KzSRC3Me+G7bN8PVmjLGGcrNpRljYr69
 u6N8cm8NGPDX+tcPKTyUzTTB2KcdNnU=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a5fd052 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Lj7BFKMBFr4BX5uBSNYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: _kKV_xs178vaQeO0h5t_IF7sH4Vegk6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_130227_920058_21AFC596 
X-CRM114-Status: GOOD (  11.07  )
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


On Thu, 16 Jul 2026 13:01:31 -0700, Jeff Johnson wrote:
> Currently, in ath11k_wmi_tlv_op_rx(), the firmware buffer is read
> without first verifying that the buffer has enough data to hold a
> header. This could result in a buffer overread.
> 
> Add an upfront length check before dereferencing skb->data as a
> wmi_cmd_hdr. The check is placed before the trace_ath11k_wmi_event()
> call to preserve the existing trace semantics (tracing the full raw
> WMI event including the header), unlike the analogous ath12k fix which
> could use skb_pull_data() directly.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Avoid buffer overread in ath11k_wmi_tlv_op_rx()
      commit: 2ab768b2a3c0a31a6270d3c7fdd25912fc341533

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


