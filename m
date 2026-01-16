Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AA1D4A5E4
	for <ath11k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S31i/edPzlupuozbV6kshI5yVsEpVcN/4WOUy2AQf2Q=; b=nvQPYFWOAXLFlW6nWGPk2QqRnS
	cqwfHDvfiGN1pDUTR3X1bKewWm6z/r6qUrX4dI/HO8Wr6m4HYWZZOWEYMxoP2kdAOiFuss8Ri5h8S
	Cu5HhQrC7xeqmFMK3DrkkFnDW8KPNImib5J0+D4n8XEShHDFX2KOqnfvjrh8K3P6lHBO+3k/BuTm7
	O7CGSOutCXYU4dfo1Zs8SXHD6OGWu/tlirj3JprNvKwvHj0SbF/gQwbL7q9BDVfRIpSIHSPYIWrjn
	YYp+J58NBu9xgdFrvkqeS7N+2XYMaXN++/m4PpkxOyqJREe01RMMAuzBMG57YWPtsJEccflwLHRKQ
	roO1Y2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcG-0000000DQ1m-2292;
	Fri, 16 Jan 2026 01:27:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYbw-0000000DPz7-2mzD
	for ath11k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMknBP3892789
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S31i/edPzlupuozbV6kshI5yVsEpVcN/4WOUy2AQf2Q=; b=KLUf8wHKbf+n0bjT
	n+FJ+U5suWLcXqk/WXGJX26euoJ6LAGrNOHEWxQAcslP623T9YzDTBDpGIZiBZOF
	8T4TMSmC8XC9RfLg13zX9x5PYUPEjlplXZ7upuRvFxLafSsD/Wu0KbY3p0VbIDci
	du8aX8hpFvL32mMZIEroMcV5bN9f4ajsbBfDwspcZ63pbA9vJs8STYjXTESwpQpd
	03Eeu0YD3Ygink6GBVpAM9NrJ/U93gAzTnIhnAXl5uKtsabj3biRRWqlqOjm1lAK
	4G1lSOAou+FrRFP5IU/bFtztEC+nDlkido1pouz/u2WzuwS986Nl+iCQWLnKLLii
	AIwMFA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b08aj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:47 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-122008d48e5so2798252c88.1
        for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526807; x=1769131607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S31i/edPzlupuozbV6kshI5yVsEpVcN/4WOUy2AQf2Q=;
        b=Y/zhMlkjtW4u0xZnAseCxTCwrBaf2oH6eHHx1FUGIBbtRg3FD0jCoPLhiVeCFhDCCf
         Dt7drOalFtJivWcnuhksFor/Nk2OE6dNeXnn6nGaiWJCNKAvZwnZeG5CicUQqSlbKbkz
         5eCIZ6KfaVXfGkKv48YGO9/oRfcbLLxEHxEIM8S57pl3rXADa76UFZa6aqKC7aRVgPTc
         xnMIv/JXHHtjKFalQgI5nd2tHTGHylq7ZCBVv+LZfkrgBVAK/XMfaaAK9EWtxXYpKZuW
         7PWJ/QWO7DGYi1UTO3zTQT/VobWBXJCSVCZYl47wovZgFcyJm7hdRVSL0uLeiFqblGxJ
         KrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526807; x=1769131607;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S31i/edPzlupuozbV6kshI5yVsEpVcN/4WOUy2AQf2Q=;
        b=C0lGG/EDjw2dekMHwyqSLcFz2CuaQ95DwwKpXQ1e7gPclug3Hc1dwLBrMfIYTJ4UC/
         zTZ/O8rQOwsk2aTmUcINjEKNCu2LkFpfkh1fCEdLDW9PukYcwItVJuXxh91F7h8TF+AA
         2u9QX3p3nhLBVOyQmnyEbiK3xU7kV6+Q952ljoQ6eVTHwD4/IvKcF3aqQeoanVAtm50d
         IOo4c0swvWNpF5MfHTLp4mQpnCYwFXqkQGqBKGCWtSeCXJn9+ZzXfgP1ZGDm7zTWXvOs
         A+DclxUlmegqta5gqvJHl8SEzFgELhNWXufbgC5+BKpOFsDDIFBbw11cX1HHq5wRQpHQ
         z2HA==
X-Forwarded-Encrypted: i=1; AJvYcCVqtaKdsYKXxeL++8b07+HWWUKWuE8EJORgLsfYSPKkLQ1qlk2rHfzeQ7O9kxtc1zIOn2TaB7Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaVZK1laUS2Yvg2NgNyIfp/ooKD6WeyRWd3W1guTiW2Qp37kYw
	WIisnLEeXkVWXRJbDWibzlTBm/snXNTAkEth0AswLYiBzXCBex5+Vl/bZ2OHXot7BGniwfcmDPu
	MQNuHoO8aInWlSFJnlEAxo5c3P0LCcvhb0aDAiQa5Wa3nINZCX/mJ83SzmB2lVW7BBZmGyvk1
X-Gm-Gg: AY/fxX4qtFPA6b7YkLaNzKSH3Oj7K04+S2ix/OTpw1xKrHnj+kwLvINSsWBmKK0Gxb7
	XXZ8Y4xu6eGbioQZVhDxHAfWtCw3J8J5Kic7WLc2wC+NsqwfP8FBocBL7Qxf8aSxuVaPUufweX7
	n0B52pkMABSM5eSMJAJufP66sKRLrIy6VEmfYAdPRclnXOoQwLu9XS1ggIhuR78YvXF2RL7NbkK
	IHtyHj5I4iYEjhDmmHh4vmPI1Dh2x3xzizt4oK2/xapJvYS/ckPAGcb2tiumbYoeOz1194sOKgD
	EtL7+32mjF1IkaNBAIbUzLaEg/4zWTVf+uIMm5q5QR/vt+RGh9sMhQ0+DmEPbb87mUhFUjODW0O
	w6AXEN47Ru7Cqm/uhRqsnjwRAnGenheUU8FzNtKS/0V0L5AHzEVhTICYzFH9nWn71
X-Received: by 2002:a05:7022:660f:b0:11e:3e9:3e8c with SMTP id a92af1059eb24-1244a7a5dd4mr1841826c88.49.1768526806679;
        Thu, 15 Jan 2026 17:26:46 -0800 (PST)
X-Received: by 2002:a05:7022:660f:b0:11e:3e9:3e8c with SMTP id a92af1059eb24-1244a7a5dd4mr1841808c88.49.1768526806008;
        Thu, 15 Jan 2026 17:26:46 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:45 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ross Vandegrift <ross@kallisti.us>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org
In-Reply-To: <wj7o2kmb7g54stdjvxp2hjqrnutnq3jbf4s2uh4ctvmlxdq7tf@nbkj2ebakhrd>
References: <wj7o2kmb7g54stdjvxp2hjqrnutnq3jbf4s2uh4ctvmlxdq7tf@nbkj2ebakhrd>
Subject: Re: [PATCH v2] wifi: ath11k: add pm quirk for Thinkpad Z13/Z16
 Gen1
Message-Id: <176852680551.1143034.16045961047643085317.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ebEzPDslWY_uefTuWGvq3LpDFhUL_APj
X-Proofpoint-ORIG-GUID: ebEzPDslWY_uefTuWGvq3LpDFhUL_APj
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=696993d7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jHorrVxA7sVQ16V33f0A:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfXzhUavRjqlJte
 wr+ep7LjX8tLX2r9Qzr7eNp6rKrcuegalKcoKx/5yXRWKC/URZZd8peZxoId95s/Y3WRo0m/27a
 rOrQgmfkpXtrfS+FufOnbI32G3X8gJlGY936SS2aaj3dI9CtH7oi3b4XZjORth6a8/VcHF3jzZ+
 5r4tNtkcPJwF0xAfC+/mSA4Ipph2xKGtH7nzNzQlpMEvb0bGQA4EroHvG8aOe1OB0/I/ws8hLac
 yNWKQdMmwCjseUC3eGSP6WzUFPQs5bVxytBvnj1Fp0YOiSqevrO0DXIttL0hYnY9RcdOmAtetGD
 3jv3/92t/lxpaxmn0D/HckpnJaPGr+Xq6AUNoloorSQ8Q1oxgwe0UnK7G2ifK5PgIPqEh6nC6Kl
 Cm0ZHtF1NzHBi3NG/NTGg+xHQDDM5QPnkjDf5STol8zPkUc8vBS0GdanOV3L3CffaW2YFausfg9
 vrl0DHCm11W35LAZlFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_172648_727017_9CC82030 
X-CRM114-Status: UNSURE (   9.70  )
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


On Sat, 03 Jan 2026 17:00:34 -0800, Ross Vandegrift wrote:
> Z16 Gen1 has the wakeup-from-suspend issues from [1] but was never added
> to the appropriate quirk list.  I've tested this patch on top of 6.18.2,
> it fixes the issue for me on 21D4
> 
> Mark Pearson provided the other product IDs covering the second Z16 Gen1
> and both Z13 Gen1 identifiers.  They share the same firmware, and folks
> in the bugzilla report do indeed see the problem on Z13.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
      commit: 4015b1972763d7d513172276e51439f37e622a92

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


