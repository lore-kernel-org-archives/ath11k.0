Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06E6D4A5EA
	for <ath11k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sacRkm3uELFuIRaM7IQCM7vn2zP/LGcG5+YS6Kv3CQ=; b=F4BdF1znAuI6EdmHKOWKPbk/Xb
	oYdhmO/USyKwRPJ0OaQSTmGecWMevj38c+eJ6KvPYPhMb7qhkhidvchJx0DJq3Nv7GRgzUEXbb0yN
	Lh19APJGnl/jAIDWUtCb0bu5LhBEY0MWyOn4MRYJjxSohsx7jJ94ZvbO8i3z2kY9jLMIcBQX3yRXt
	XLKL6tikAVNGkE4I89C7tqonygSe5/8QVTpeDFeQClPuf8zAuF09Sqm2PDtmw8sPDld5Oz6jCAamO
	HZjMSrVvK4gZ1QIIij1Aa8GJWuHgl10NtxZXsK9qHJPHzL3+kDZeM1E5+Ybu0VLr1TGxnSUEjUXGs
	MKdVw1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcM-0000000DQ7W-230G;
	Fri, 16 Jan 2026 01:27:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYbw-0000000DPzX-3wDu
	for ath11k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMaUXi3192467
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5sacRkm3uELFuIRaM7IQCM7vn2zP/LGcG5+YS6Kv3CQ=; b=K54VTYsL1A4n4KuP
	YqhLzwzMdT2pzbufJeseRgfO1xj4EpWn8nmAbRkIqnU954KpNIwKouUc8iYgnsN4
	zjjfCECLYZsUsnwql/qqGyEoqtFNLU3PNF3EUdQnRfBVG4KZKG2JGoxjTdCHlHVZ
	wEg/qMqAWU/w5yXY7gOJjreP0129KQbQGZ4t0KNijChhF2zzOJ7KZM5TYFhFYtOa
	0JzE7s1XYq+epFKgrj181nxAXmO3VLFSmAavNWVakQw2Ju7redXOOJukdz0gq/sy
	2qEf5NUrigCdhQTCqqtBsdSX9v4YPU3Qu6pLnmSGvihK5mJzvHykkOHtOmIGuUBa
	JeR8qQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968gbvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2adc3990fecso1086208eec.1
        for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526808; x=1769131608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sacRkm3uELFuIRaM7IQCM7vn2zP/LGcG5+YS6Kv3CQ=;
        b=P7aS5w+MZqjgNIMV+stSpf65X9HV1WmxK+XaYEZ1LUuPWUPctdupR/TpYml3SccKqs
         CAMkcvb627544Si0Tcv91TKmNFS2P+kn7sw0xr1jjTjojRQErj8klP5wXDQwqVONej5u
         JVFS/qdd7ONViV+AnlWKnc1zKHVb4O9dri5q7jIZKT4ksaDgkSvlTDHxoSomGavqNHPG
         b25/9mbfEGJQGeC6uWsaptOOSzo+r+Cs52s3+BmheXBFWLwCm1wNH1pVcr4e9DyV0exk
         L8oomxq5XmI6gBzcwTj2o0/i432UAK2z0dHpeHrl4WUPSLSmha2MvU58yeLM031ZxqPl
         hIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526808; x=1769131608;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sacRkm3uELFuIRaM7IQCM7vn2zP/LGcG5+YS6Kv3CQ=;
        b=xN6g/i6kSIiIrvdXEi2zJsjU9cvcQ5EOg1F3dckZli8Qvzv2uAPEOCFex+Q0PXvrcK
         TmpLu6hM2A84DNqmEky1U4kvi/woFCgYNiX+xpQXZCNMYPew6Z8mJY0Pfrf5ii3yeWxC
         S4Uo4rWT/Cl1xHoaPdLq96kfnyB4GW6ySiA0Pim7nCTBI4O2hKJmNcQjvmX0zdJ7oCI+
         i2EROF01egP01BMBPlNJTMv//qRGul0oYCg8CBZtV5wPwl80aEMGHSdD92Ti4oe7mH71
         ZFzc+oDxFmOmHHW4Tu0Jxtf0KStP/Eo8tJk+9s5M/dYUpVGMHbHOVJJQDw5bcabv6WRS
         yVQQ==
X-Gm-Message-State: AOJu0Yx6r56F9fkua5vFMaE8A8HJuqdu0RuK8z0x0qioYWj5aRGZ8uBo
	OwiffBkM7F0jO44mQX1QUTg/aOkqAlRceqa1Cw8hjEKleo0XQgSAIjmZHtqQ7FAT9sy1rxRSvX4
	JNCl5t0oyes3AzuLBknZlc7Iml4Po6ECbVxqsks42s+gmTG0tKrOx+btrmaiLZs4x7TfbPhXq
X-Gm-Gg: AY/fxX7U2tC9LNpt3ku82I4/lsRo4v93NIeetdbHYtGzmk85D2by6mU0C/2JPfF56OO
	u2/NchI8QZ1DkIKprUwIdnbiV+jEzR1DhUknKQl75atdTukMkjSXKCT5WeRvYqI03okWSlO7Ceq
	9vMAfOczyZ9YdIjDjn3p5MILz3R6zkcR5YU5chgOA+F0NqdDcBzCkUx9ujChwYevQKzj7namZXS
	L9tNcctLYcO2wWgiRUw8wM+R6BCRFD6UN2kdOPDMUFZbkjAbRVbYjhH+bCOuYuwGG7w79PPD9Xc
	bFfKfzubS9ANW6/HMGNMJKYBjLrDXVI5ProTeh1B0qzvWKkNtIG+mU349lt8mgDwAGtfw4CTLup
	MZSIyPJNEY/4OF35RLNaU6m5Ex3Hxye383ie8lXeugQF6JB8iLVVEDV/pyeADQvDB
X-Received: by 2002:a05:7300:ec08:b0:2ae:5b9b:c060 with SMTP id 5a478bee46e88-2b6b349a9a8mr1303155eec.6.1768526807443;
        Thu, 15 Jan 2026 17:26:47 -0800 (PST)
X-Received: by 2002:a05:7300:ec08:b0:2ae:5b9b:c060 with SMTP id 5a478bee46e88-2b6b349a9a8mr1303141eec.6.1768526806718;
        Thu, 15 Jan 2026 17:26:46 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:46 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260108034607.812885-1-qian.zhang@oss.qualcomm.com>
References: <20260108034607.812885-1-qian.zhang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath11k: Fix failure to connect to a
 6 GHz AP
Message-Id: <176852680628.1143034.11034029049745155989.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=696993d8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uHwbLgxxtvURWPBYDoAA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: QGimM4NSODb2MHdc4fd0QAw445XM0RVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfX7T6hPZWcEahD
 BUlVTLaTQkVUyTVzuXgBQk50Nia8SQJw9laGlx/Y7h4mNgHfyQpw3eVHPsvJCLzw18mxguNUJWa
 zgXOa0JLz/0kdf3WFfPGpVGateblZM22yxAF0D3XIffbDrooE63fH3TnVt6pEQ+VXRkN6nidIiX
 jjdidS7lFo0Yqez+Qg7pHruMLkWNVyvdDS6HJv/sJthnIspb/syxzj0ncMULcC+R8jpXrmhUZMv
 rkq/o2+hjbW9FXi0+cAg6kpzoyVCQgPjHHntVphNc++w1bON6Jx5Znjbn7ZDlg8CfChbU298PVO
 clVIVHNhe1dVgXqzbsItQvJJJPs3LzT11ZKzs3zL3imXMukwldLJ3KX6QiCsFYmSr14402d/Y+l
 1JMf61HVgZ26EXrA2mquWVj0NMXDlsEWtR3js5ulk1uwYaO2ESb9QdhCL0elSxxXnD9IUan/R71
 1cFTeHuxGg7Kn7QgROA==
X-Proofpoint-GUID: QGimM4NSODb2MHdc4fd0QAw445XM0RVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_172648_983250_48EC395C 
X-CRM114-Status: UNSURE (   8.42  )
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


On Thu, 08 Jan 2026 11:46:07 +0800, Qian Zhang wrote:
> STA fails to connect to a 6 GHz AP with the following errors:
>  ath11k_pci 0000:01:00.0: failed to handle chan list with power type 1
>  wlp1s0: deauthenticating from c8:a3:e8:dd:41:e3 by local choice (Reason: 3=DEAUTH_LEAVING)
> 
> ath11k_reg_handle_chan_list() treats the update as redundant and
> returns -EINVAL. That causes the connection attempt to fail.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix failure to connect to a 6 GHz AP
      commit: 0bc8c48de6f06c0cac52dde024ffda4433de6234

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


