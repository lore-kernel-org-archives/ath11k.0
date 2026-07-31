Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EC9C55167
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 03:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=as5PaZAALTVVq6IlutHz9VWYoUgQHw+2B+BbBfIDAK4=; b=uFHF/2+/JBg3RJirCKZWY1AVqF
	nXUwqWA+LS7HbGp7yrf6FxCwEtBkfpi5FKvm9+X0V2Kgj8XZCBZGOzSXK58iiGiv4/uduG4OOAS29
	nP2Uo83XaJpwgIrBbT45lvnfriuLOAhsH8BaASAbC70OYYytmhvIOb5nJfHgBDaIqLrGgzgtHh5YN
	h/jO6uFTJChC743NoRdPKw1j/LcEQEEDYW3iW3pRsBkgyXFQe64TB1EvTLmG+gZGqNvztaou4Ff3i
	YDqvM1atcUsaqpqI9GsXx0f5W9v8qOO/pPvtHbUujeTTa/fYAD8u1x1KVav7PWY2v1zFizI6YyihI
	Z+K3Bumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeJX-0000000Bi6b-173y;
	Fri, 31 Jul 2026 03:53:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpeJV-0000000Bi6H-0ylb
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 03:53:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2IQPa2781172
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 03:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	as5PaZAALTVVq6IlutHz9VWYoUgQHw+2B+BbBfIDAK4=; b=c4zX22QTzPmpF6Fj
	vuhV2lmCSbUm82+vnUBS8O9fAbYEfsr4p6fKtr6XY/ApExdjaRYBRLn40v8YZlN4
	S7G+99Pa0QMPXHPTT2T9XkiKPsYW9UY7thjZl8fJMj5qEx/BkVEwxMeWEwqL8npx
	dwLsnsF8jyUFHYJrisdqgfXrkFbg5PX7PQtJw5tBa113R+Yx+bp8Ij3jsff297om
	4RJmUKBrXUjF1Jb6ylzE5Wuya/SCPPmTW6teOj0xg3Uf10p7tw6xHkPj26fjTFo4
	cqkz6499migjccA9iaoL4tHWYPCTgrJ4GdlYqA0Mxa2TTKECHhLz9ITQo3FvMBUX
	U7yTsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjtag9u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 03:53:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1070047a91.1
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 20:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785470015; x=1786074815; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=as5PaZAALTVVq6IlutHz9VWYoUgQHw+2B+BbBfIDAK4=;
        b=bthTsWBkguajXw5RBA6IzL+NGhyCxWoIcs67IMtDAqdwH6Dj7gVF6scjVhSYD1pYgp
         rmXl3Pd4831ic6QsQPGHieczHyx5r0lYeoJmJZrfeRh5BXl4lQDxjY7rL2n7y2UytvaY
         MOW6b8vytGySF2xSFdLLqrWMqOsaKR/hmtk6DXzQMX4eOSggeaNgM912CCm7DoQDnvRW
         8iK1Jx0cn2kycpKo8aacuxDenPw1hEG4ddwOnHZoeZMA3ndsLaYegp8new8HbsTyrh8z
         ZPtVhTf5X6YWHsdXtIdkuryJFwRKPJs+ZMbrN4HR1Ys0iYFX0wYG95LKTU9nnVChmoyY
         ZFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785470015; x=1786074815;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=as5PaZAALTVVq6IlutHz9VWYoUgQHw+2B+BbBfIDAK4=;
        b=oCu/9CBt5z2KzCy33sKIe4hYVpcFeiDKhiUGVByVVmwLkLKVL0f/dIc5qlqSenf92i
         H4xECQj9FWGa/cHEQb7el05Z9ThzSjUl/HMVR3sI0AnOE87InLiUOEnby4G7eEveoEIe
         g0dgXTGyiAy+S0ifMvpQF7iBY0JhYcb2K7Y8ZSKFhk1iNylAYShvRj7Kuvba45a0N4CM
         TjlHSz8wO1GLGX19RG3X0yoTt45VvH4YnErhtY/Fi0PQi98W+6S6r7vjo0u9qbL946pz
         ZT1hjHTJWzZpZeKQN5HZ2RIty2KaTCb23MuniF9dv8XXgANWT88ZkF8SlEnjQ2dxxKi5
         Hwng==
X-Forwarded-Encrypted: i=1; AHgh+Rrpg2oH5omaWtMoFcgEIYqW5dQUhwETfEIc4Ie42x2g2nLwx+z32ds+RzBE/U1Lye7DcqitUV0=@lists.infradead.org
X-Gm-Message-State: AOJu0YywSb3jZ9wMeYOXbg36xwhDRrUUA8sLFOVlgUlXt8+A9ciawMuy
	+OkHYoUOnK6R1WmmtOSdhyGIc55Kd1/Qq+r77F1MykdMJ4BVytSApyyp5FuqE78NcwHNgsubJsO
	hQ8/nUPGWPnwavnw5L/Ls25o8U6wWZ/8DOOuCU4NFEy8iGI6gbpt+5v2t639Om/+Q
X-Gm-Gg: AR+sD10chQK3K91scxOpVdfZhBbVpZX4iIFhk86QtW3SfRrrXocZLaMD3Zj2Ou0dz0C
	qX9ktnrgB9tP4z/RZdu1yxaH1DDaax5RFpZtL/gawQkRIpKz05E7EIODmT6JCjHvY46eMQ4PFuB
	SwxCGdAxVd10GHRDfXw01W4Zgb6gnwqFDc17hx0q5Mbdb/agbv5xzEUXCCgpQ3ql9Ra9JNStKXy
	gaCHgrKAfskwdc2KASWAIIBpvpOUzb3AL4GwiLeC4bDicnF8+y6Fl40CZpbXdKusdkzCkYYhBcZ
	E3zDNRZ/W+EssH4XjbLk4tgqMecwgsIvTpyrSKg8quaWA5BlazSMHKk7UzG01NyIQN56cQg/MWo
	PkmqimJFgi74ns/t2LrrMWdvDaqqI16tZW20UIVQchodqNAcecaJyydnHqeoEyVURLsd4Vtr5Pw
	==
X-Received: by 2002:a17:90b:5343:b0:38e:76f8:fcb1 with SMTP id 98e67ed59e1d1-38fb144f3e8mr488795a91.32.1785470015049;
        Thu, 30 Jul 2026 20:53:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:38e:76f8:fcb1 with SMTP id 98e67ed59e1d1-38fb144f3e8mr488771a91.32.1785470014614;
        Thu, 30 Jul 2026 20:53:34 -0700 (PDT)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2bae2efsm76141a91.11.2026.07.30.20.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 20:53:34 -0700 (PDT)
Message-ID: <bc84e489-5907-422f-a601-d2aef75c33bc@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:53:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: cleanup arsta in
 ath11k_mac_peer_cleanup_all()
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260730140232.133500-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260730140232.133500-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAyMSBTYWx0ZWRfX8Z/gKi9Gor0Z
 /aPZ99VSSLlYTAqMq7Ml36NJQV/gXgwr6qqUVkRBYVJ+vAZbbRiJAN4XB/uIuClKNyWE2RUZxSo
 PdYTBBy5X0CQ/I2hWQ9q5NCDnG/AvGTWm0lCenoCDcl6/R+Jg/OVwYK0zzIsOrg8P+MGk9gl/OW
 H7irJIDm7y0jfIvvktJaGImh/3lJBI31mMD7s4HLpttIJstt6jh8L0bizTrnVWLJBEVPnDn9Cy9
 woeraNYbTJQqfEgU/YQ24HxjeY01ly4vVgJGC0vVuTlNjCrI+RJDZ5nCF1OZ1wYVPerkfX1Ca9k
 2JL9Bj8JW5QNvKrySofUs7r9knYgjLMFhGtLBwR5P+WmjwKJTJfr1WmLxxDQclw6NJ5WLD5eUZM
 fMgI1JGuz0+y9oTGFPPvfC58PUl9tMV9cZIrxwzKLJ4NJx84HwhyNNgCzqDwCBwCNLvWDWdAH0G
 HKkjpfhASPtrqt9RsEA==
X-Authority-Analysis: v=2.4 cv=ZdYt8MVA c=1 sm=1 tr=0 ts=6a6c1c40 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=nwA6kXA-DBkKNBvwkvIA:9 a=QEXdDO2ut3YA:10 a=DVKqRkKJf1IA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: q8o_rww8QFIMhloepe0mbWYWJR6QrB8E
X-Proofpoint-GUID: q8o_rww8QFIMhloepe0mbWYWJR6QrB8E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAyMSBTYWx0ZWRfX9lpn4WbzRogK
 lEeNs+vJqFTH3tv/UXG8oD91k79P0cmH2b7V3ZA6m2x9CNJwwhWgP1OnYp7axgqxeYrpdOQvElw
 REWFRrkW2aFLFosZc9jk5Wem6STMyNY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_205337_415580_DC142013 
X-CRM114-Status: UNSURE (   6.12  )
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



On 7/30/2026 10:02 PM, Nicolas Escande wrote:

> Tested-on: QCN9074 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

the hardware version is missing between target and bus type:

QCN9074 hw1.0 PCI

guess Jeff can handle it .




