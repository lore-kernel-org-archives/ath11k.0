Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EA9CDB474
	for <ath11k@archiver.kernel.org>; Tue, 17 Oct 2023 19:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEsVsuWcnEpL2eiyaCQmO+0CjbfjDic8KFEnJc1Ppzk=; b=ODUZMGkPqOTySV
	x80Y/VuMEGLzoSelzLVk8i2PlDMMvtWgkAuQAufdv07lU+D+cqlRrYuOIWHKgE5t2SA1huRNP2azg
	T8ZkfrcosCcWs0gpNLhQ1qq3RZdC5xtN86DnJUFQUxLHRsaiIdMV5Tz2VympwqnqvZ153Vy+Dx6Xg
	XHiDyCunSKohD9zlVt/CyLQZ26yk9JGPLBXwWV3yNgGbrtMwwASAhtrIO7mSdatt+IbjbG2t67g9C
	YlIb1Rj4KKIe53AJDUwKoMRumnB3Nar8/MwePbQBbepQaOKHPX08Sik8tsltbc2HV4FVzLMb9VLcY
	2gRNPI0I0Zas4LfWVkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsptp-00D7kx-2w;
	Tue, 17 Oct 2023 19:38:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsptm-00D7kT-1E
	for ath11k@lists.infradead.org;
	Tue, 17 Oct 2023 19:38:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39HEpHlK008545;
	Tue, 17 Oct 2023 19:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Y/y/0QnvL+eGuC45VSQaLho4UKeRTLlSMFuoL+S2R3s=;
 b=HVhHin25G4RbYNVJgrEr+L/hNAkT915szH9m0jywXvcW/UcZPyeLPoPg4B6xTRtG0YtB
 3PYuzBqtbwRQ2oxORYZvZUN841MSsEnUoV0YUYYl6I8qM4Ry7C7phmoSdeTQDBn3v7LX
 3cc64pnEVcsRMaziLN3C/OSSsFM+fNl+oBvgiVdaf6qUafgO/78HCsrBnfzIWsNMgJy2
 34uLOW9YQ8oRb3sKcwYXIRUyAeY3ZPnCY0r5lFg0MV/r1PYkq/Im3xxLQzPMa7XBtWHU
 zaYbnaSIXBky9LnxyqyfQ03F4CDUMV2ubx/+OtgTKFZL8jlb/WmjsKU3O6zUjrG5U5uD Ew== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsr7c1a6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 19:38:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39HJcWZE011445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 19:38:32 GMT
Received: from [10.111.183.229] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 17 Oct
 2023 12:38:32 -0700
Message-ID: <8a825923-c34d-40b5-812e-e28a25c83eb5@quicinc.com>
Date: Tue, 17 Oct 2023 12:38:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix -Wformat-truncation warning
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <87fs2k5l1a.fsf@kernel.org>
 <20231017155342.112032-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231017155342.112032-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vdBeFmwcPG6rSwAw11GbHP1EfrxeTbR1
X-Proofpoint-GUID: vdBeFmwcPG6rSwAw11GbHP1EfrxeTbR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-17_03,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=463
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_123838_558272_57AEA6F8 
X-CRM114-Status: GOOD (  10.66  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gMTAvMTcvMjAyMyA4OjUzIEFNLCBEbWl0cnkgQW50aXBvdiB3cm90ZToKPiBGaXggdGhlIGZv
bGxvd2luZyB3YXJuaW5nIG9ic2VydmVkIHdpdGggR0NDIDEzLjIgYW5kIC1XZm9ybWF0LXRydW5j
YXRpb246Cj4gCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9kZWJ1Z2ZzLmM6IElu
IGZ1bmN0aW9uIOKAmGF0aDExa19kZWJ1Z2ZzX3JlZ2lzdGVy4oCZOgo+IGRyaXZlcnMvbmV0L3dp
cmVsZXNzL2F0aC9hdGgxMWsvZGVidWdmcy5jOjE1OTc6NTE6IHdhcm5pbmc6IOKAmCVk4oCZIGRp
cmVjdGl2ZSBvdXRwdXQKPiBtYXkgYmUgdHJ1bmNhdGVkIHdyaXRpbmcgYmV0d2VlbiAxIGFuZCAz
IGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSAyIFstV2Zvcm1hdC10cnVuY2F0aW9uPV0KPiAg
IDE1OTcgfCAgICAgICAgIHNucHJpbnRmKHBkZXZfbmFtZSwgc2l6ZW9mKHBkZXZfbmFtZSksICIl
cyVkIiwgIm1hYyIsIGFyLT5wZGV2X2lkeCk7Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IGRyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMWsvZGVidWdmcy5jOjE1OTc6NDg6IG5vdGU6IGRpcmVjdGl2ZSBhcmd1bWVudCBp
biB0aGUgcmFuZ2UgWzAsIDI1NV0KPiAgIDE1OTcgfCAgICAgICAgIHNucHJpbnRmKHBkZXZfbmFt
ZSwgc2l6ZW9mKHBkZXZfbmFtZSksICIlcyVkIiwgIm1hYyIsIGFyLT5wZGV2X2lkeCk7Cj4gICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn4KPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL2RlYnVnZnMuYzoxNTk3Ojk6IG5v
dGU6IOKAmHNucHJpbnRm4oCZIG91dHB1dCBiZXR3ZWVuCj4gNSBhbmQgNyBieXRlcyBpbnRvIGEg
ZGVzdGluYXRpb24gb2Ygc2l6ZSA1Cj4gICAxNTk3IHwgICAgICAgICBzbnByaW50ZihwZGV2X25h
bWUsIHNpemVvZihwZGV2X25hbWUpLCAiJXMlZCIsICJtYWMiLCBhci0+cGRldl9pZHgpOwo+ICAg
ICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IFNpbXBsaWZ5IHRoZSAnc25wcmludGYoKScg
c3RhdGVtZW50IGFzIHdlbGwuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0Br
ZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBBbnRpcG92IDxkbWFudGlwb3ZAeWFu
ZGV4LnJ1PgpBY2tlZC1ieTogSmVmZiBKb2huc29uIDxxdWljX2pqb2huc29uQHF1aWNpbmMuY29t
PgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
