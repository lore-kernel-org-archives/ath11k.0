Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B36C636CC
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 06:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48EuwNrOSEVHuWuL6ngw5OwiB57u+mwMVewudtHFfWg=; b=1ua4jLdxU5+pakoICfU1aO+Zyn
	1KAArYm2y+sSbLNbdB+/KSu4lwz7Q9X7xonnuUfJGnaBH1f/XEnQSXLEnZv0cTqNurQbeyG3vdPol
	Nbows8soVH/vtRAIjac1GyO23N1lO0j296jTZtl941bZ7Y2gjIrMQwcTS8K3P37CX+3KP9pLQC6h7
	3U4pZ9JPi+7sR83zyGtqyPlEoDMSU4SU7W6XmHBbZEM2kpVuySv3Pwfb/0Dz8StQpq30fBN3hIBaG
	RanWFrGSi6fFSb68eXdcZxuDFsC2mhEC2QEdADkHv8xADHLdunm1reN1ThxFeRqdhjGY388WjX3Gm
	1NPcjYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRS11-00DJ8E-3r; Mon, 13 Feb 2023 06:08:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRS0w-00DJ6S-Tv; Mon, 13 Feb 2023 06:08:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31D44R9W011021;
	Mon, 13 Feb 2023 06:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=faZR2Hle9FYqO/1MfL5mXQlep4AUADPLyV2UAduKLf0=;
 b=djj8jqADikriEh3hCCtzJsiTx2AZUwSDanJ5UGcReRUdb5W542zX01+NRKiR2O/OO4r/
 1LdNi/nPnTV0Ct/zXedFSlWzmbqXIIb1jBaY77sQsvCwmwesPHC7EEjrp2N2kQWelcvY
 SNgEQp4yRqQx6FoV3xBzp9jfuVZKMNpFyvlbkAQ02zQO2YnPViolMfpOtL7F645qpU8y
 pPZrVxGY3uJZY0WRKVkO6hkbVlBzFLHDddx2M7WWdCDzoOqn27IOZUi6uSq3cg7gd8sY
 hf39lWKPwGgKa5j2fNGAU9MdlH03DWJ2byonYJBqCnLyxg8D28vdwBQVv9Nqlk+vCCQ9 /Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3np4agb4fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 06:08:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31D68SQf007490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 06:08:28 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 12 Feb
 2023 22:08:27 -0800
Message-ID: <b5cb1b04-91fe-bf23-8001-fdd4e6b39c97@quicinc.com>
Date: Mon, 13 Feb 2023 14:08:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] Rescan on regulatory domain change
Content-Language: en-US
To: Nicolas Norvez <norvez@chromium.org>, <hostap@lists.infradead.org>,
        <ath11k@lists.infradead.org>
References: <20211223023358.1645032-1-norvez@chromium.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20211223023358.1645032-1-norvez@chromium.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VWr0pxyg9PxukVqgLvgI-MLdTMvLzYzo
X-Proofpoint-GUID: VWr0pxyg9PxukVqgLvgI-MLdTMvLzYzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_02,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_220835_008914_280585D2 
X-CRM114-Status: GOOD (  21.40  )
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

T24gMTIvMjMvMjAyMSAxMDozMyBBTSwgTmljb2xhcyBOb3J2ZXogd3JvdGU6Cj4gT24gYm9vdCBv
ciB3aGVuIHJlc3VtaW5nIGFmdGVyIHN1c3BlbmRpbmcsIHJhZGlvcyB1c2UgdGhlIGxvd2VzdCBj
b21tb24KPiBkZW5vbWluYXRvciBhY3Jvc3MgYWxsIGdlb2dyYXBoaWVzIHRvIGtub3cgd2hpY2gg
Y2hhbm5lbHMvYmFuZHMgdG8gc2Nhbi4KPiBCZWNhdXNlIG9mIHRoYXQsIHRoZSBmaXJzdCBzY2Fu
IGRvZXMgbm90IGRldGVjdHMgQVBzIHRoYXQgYXJlIHByZXNlbnQgaW4KPiBiYW5kcyB0aGF0IGFy
ZSBub3QgYWxsb3dlZCBldmVyeXdoZXJlLCBsaWtlIHRoZSA2R0h6IGJhbmQuCj4KPiBXaXRoIHRo
aXMgcGF0Y2gsIHN1cHBsaWNhbnQgdHJpZ2dlcnMgYSBuZXcgc2NhbiB3aGVuIHRoZSByZWd1bGF0
b3J5Cj4gZG9tYWluIGhhcyBjaGFuZ2VkIHRvIGluY2x1ZGUgY2hhbm5lbHMgYW5kIGJhbmRzIHRo
YXQgd2VyZSBub3QgZW5hYmxlZAo+IHByZXZpb3VzbHkuIEl0IGFsbG93cyB0aGUgc3RhdGlvbiB0
byBjb25uZWN0IHRvIFdpRmkgNkUgQVBzIGZhc3RlciBvbgo+IHJlc3VtZSBpbiBjYXNlIHRoZSBv
bmx5IGtub3duIEFQcyBhcmUgaW4gdGhlIDZHSHogYmFuZC4gV2l0aG91dCB0aGUKPiBwYXRjaCB0
aGUgc3RhdGlvbiBkb2Vzbid0IGZpbmQgYW55IGtub3duIEFQcyBhZnRlciB0aGUgZmlyc3Qgc2Nh
biwgdGhlbgo+IGl0IGhhcyB0byB3YWl0IGxvbmdlciBmb3IgdGhlIG5leHQgc2NoZWR1bGVkIHNj
YW4uCj4gSWYgdGhlIGZpcnN0IHNjYW4gZG9lcyBjb250YWluIGtub3duIEFQcywgdGhlIHNlY29u
ZCBzY2FuIGlzIGNhbmNlbGVkCj4gZWl0aGVyIHdheS4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY29s
YXMgTm9ydmV6IDxub3J2ZXpAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICAgd3BhX3N1cHBsaWNhbnQv
ZXZlbnRzLmMgfCA4ICsrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvd3BhX3N1cHBsaWNhbnQvZXZlbnRzLmMgYi93cGFfc3VwcGxpY2Fu
dC9ldmVudHMuYwo+IGluZGV4IGY1NWUxODQ2ZS4uNTljZmU2MzhiIDEwMDY0NAo+IC0tLSBhL3dw
YV9zdXBwbGljYW50L2V2ZW50cy5jCj4gKysrIGIvd3BhX3N1cHBsaWNhbnQvZXZlbnRzLmMKPiBA
QCAtNDMzMSw2ICs0MzMxLDE0IEBAIHZvaWQgd3BhX3N1cHBsaWNhbnRfdXBkYXRlX2NoYW5uZWxf
bGlzdChzdHJ1Y3Qgd3BhX3N1cHBsaWNhbnQgKndwYV9zLAo+ICAgCQkJd3BhX2RiZyhpZnMsIE1T
R19ERUJVRywKPiAgIAkJCQkiQ2hhbm5lbCBsaXN0IGNoYW5nZWQgLSByZXN0YXJ0IHNjaGVkX3Nj
YW4iKTsKPiAgIAkJCXdwYXNfc2Nhbl9yZXN0YXJ0X3NjaGVkX3NjYW4oaWZzKTsKPiArCQl9IGVs
c2Ugewo+ICsJCQkvKgo+ICsJCQkgKiBMb29rIGZvciBBUHMgaW4gYmFuZHMvY2hhbm5lbHMgKGUu
Zy4gNkdIeikgdGhhdCB3ZXJlCj4gKwkJCSAqIHByZXZpb3VzbHkgZGlzYWJsZWQuCj4gKwkJCSAq
Lwo+ICsJCQl3cGFfZGJnKGlmcywgTVNHX0RFQlVHLAo+ICsJCQkJIkNoYW5uZWwgbGlzdCBjaGFu
Z2VkIC0gcmVzdGFydCBzY2FuIik7Cj4gKwkJCXdwYV9zdXBwbGljYW50X3JlcV9uZXdfc2Nhbihp
ZnMsIDAsIDApOwo+ICAgCQl9CgpUaGlzIHRyaWdnZXIgbWFueSBzY2FuIHJ1bm5pbmcgb2Ygc3Rh
dGlvbiB3aGVuIGRpc2Nvbm5lY3QgZnJvbSBhbiBBUCBieSAKcmVjZWl2ZSBOTDgwMjExX0NNRF9S
RUdfQ0hBTkdFL05MODAyMTFfQ01EX1JFR19CRUFDT05fSElOVCBmcm9tIGtlcm5lbC4KCm5sODAy
MTFfc2VuZF9yZWdfY2hhbmdlX2V2ZW50KCkgY2FsbGVkIGJ5IENhbGwgdHJhY2U6CiDCoHJlc3Rv
cmVfcmVndWxhdG9yeV9zZXR0aW5ncysweDRkOC8weDU5YyBbY2ZnODAyMTEgCjhiYWJmYjRlYzQ3
ZDM1NzMxYjUwOTFjMTc0OGIzYmZhNmVhMTVlNjFdCiDCoHJlZ3VsYXRvcnlfaGludF9kaXNjb25u
ZWN0KzB4NDgvMHgxNjAgW2NmZzgwMjExIAo4YmFiZmI0ZWM0N2QzNTczMWI1MDkxYzE3NDhiM2Jm
YTZlYTE1ZTYxXQogwqBkaXNjb25uZWN0X3dvcmsrMHhmYy8weDEyMCBbY2ZnODAyMTEgCjhiYWJm
YjRlYzQ3ZDM1NzMxYjUwOTFjMTc0OGIzYmZhNmVhMTVlNjFdCiDCoHByb2Nlc3Nfb25lX3dvcmsr
MHgxNDAvMHg1MTAKIMKgd29ya2VyX3RocmVhZCsweDEyYy8weDJkOAogwqBrdGhyZWFkKzB4MTNj
LzB4MTU0CiDCoHJldF9mcm9tX2ZvcmsrMHgxMC8weDMwCi0tLVsgZW5kIHRyYWNlIDZjZDk2OGVi
MDZiODM2MDEgXS0tLQoKQ2FsbCB0cmFjZToKIMKgbmw4MDIxMV9zZW5kX2JlYWNvbl9oaW50X2V2
ZW50KzB4NzQvMHgxZDAgW2NmZzgwMjExIAo4YmFiZmI0ZWM0N2QzNTczMWI1MDkxYzE3NDhiM2Jm
YTZlYTE1ZTYxXQogwqBoYW5kbGVfcmVnX2JlYWNvbisweDFmMC8weDI3MCBbY2ZnODAyMTEgCjhi
YWJmYjRlYzQ3ZDM1NzMxYjUwOTFjMTc0OGIzYmZhNmVhMTVlNjFdCiDCoHJlZ190b2RvKzB4NTVj
LzB4NWRjIFtjZmc4MDIxMSA4YmFiZmI0ZWM0N2QzNTczMWI1MDkxYzE3NDhiM2JmYTZlYTE1ZTYx
XQogwqBwcm9jZXNzX29uZV93b3JrKzB4MTQwLzB4NTEwCiDCoHdvcmtlcl90aHJlYWQrMHgxMmMv
MHgyZDgKIMKga3RocmVhZCsweDEzYy8weDE1NAogwqByZXRfZnJvbV9mb3JrKzB4MTAvMHgzMAot
LS1bIGVuZCB0cmFjZSA2Y2Q5NjhlYjA2YjgzNjA0IF0tLS0KCj4gICAJfQo+ICAgCgotLSAKYXRo
MTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
