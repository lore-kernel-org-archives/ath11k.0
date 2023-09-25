Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475FFCE7A81
	for <ath11k@archiver.kernel.org>; Mon, 25 Sep 2023 10:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYXS1+prUvBpJ7wzi9qu6UoDugPsVOiDUvX9nhjw710=; b=UoxkEdLet807mi
	kmNbBSIyVdOY3v5VOhv3LcG/NFnY3LE2pjVNsLjkSrDs7Gbop6mkq3676/wBFaWm1xeW41P7HVZv+
	y6xKW0CenkcfvHzMHCwH0X0h+pdyCbWYRbltS1n6EalDAN6s+nQlNC4oAbgZen+yqUDlrRwSIxM/J
	f0+LDRoIFWtxQiKhIgZMbGpk22CU6pRXukSPp4ISbm9VGTNSv6JCIGBPvK0WKcJM8oLlpdxqztfMc
	mWd807+G4OlGxSCpxgo3C0sqVmFp6G47ugqAn6r7FmD1omfz5ph5VWIgL0GIkMqX3EXz8o2FuKp1t
	LzdCKNHxmvwRLTlyQKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkj71-00E0Dk-00;
	Mon, 25 Sep 2023 10:46:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkj6x-00E0Ce-1h
	for ath11k@lists.infradead.org;
	Mon, 25 Sep 2023 10:46:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38PARxTP020579;
	Mon, 25 Sep 2023 10:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NIdPdbnvJfJEYbUcscur2aVMLJmMMeL0hQsOcreDeYQ=;
 b=bz/XcSj/6fkxvXBdmqY79L8GD7mcbiE9FvqcsXp4XBhp18eoMzUHc2FXdJ/pYP6Xcqw8
 y1UR9wd5oezIrPAcC0aeWtoniosL4v4bZ7ThMuzaFd9ZIqfTp2hMrVFZtvpTZ5NJ7QY9
 KGr1rR9OB0TlmniGyrHD+4CP5aqyLAVxpyN+YmodZeiieMMR02Viw2YIbPGEw+ubV092
 s9AFLPHC94UxsD5zK8RIM4OCLmG2VAQliCAgcFMP6unW3Jy+3cQI2teapnNrFYwQT6k1
 5Z8WLZ3DqLagUInnwllHZ2I7ci9S+p1N20mm8QHCpvQVTGh532q33sN54oSE1Irw0ib7 lw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tb6tt06wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:46:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38PAkaY6016466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:46:36 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 25 Sep
 2023 03:46:34 -0700
Message-ID: <8eba8b54-5805-151f-5283-8383d182ae3c@quicinc.com>
Date: Mon, 25 Sep 2023 18:46:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 09/13] wifi: ath11k: fill parameters for vdev set tpc
 power WMI command
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-10-quic_wgong@quicinc.com>
 <13152047-9109-449f-b4f4-55fb7f4bb3ac@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <13152047-9109-449f-b4f4-55fb7f4bb3ac@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zaIwJjfSY_3FJ7K7sbfiTaGLywJuZnTD
X-Proofpoint-ORIG-GUID: zaIwJjfSY_3FJ7K7sbfiTaGLywJuZnTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_07,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2309250078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_034643_681035_2D8125CF 
X-CRM114-Status: GOOD (  19.58  )
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

T24gOS8yMi8yMDIzIDQ6MTEgQU0sIEplZmYgSm9obnNvbiB3cm90ZToKPiBPbiA5LzIwLzIwMjMg
MToyMyBBTSwgV2VuIEdvbmcgd3JvdGU6Cj4+IFByZXBhcmUgdGhlIHBhcmFtZXRlcnMgd2hpY2gg
aXMgbmVlZGVkIGZvciBXTUkgY29tbWFuZCAKPj4gV01JX1ZERVZfU0VUX1RQQ19QT1dFUl9DTURJ
RC4KPj4KPj4gVGVzdGVkLW9uOiBXQ042ODU1IGh3Mi4wIFBDSSAKPj4gV0xBTi5IU1AuMS4xLTAz
MTI1LVFDQUhTUFNXUExfVjFfVjJfU0lMSUNPTlpfTElURS0zLjY1MTAuMjMKPj4KPj4gU2lnbmVk
LW9mZi1ieTogV2VuIEdvbmcgPHF1aWNfd2dvbmdAcXVpY2luYy5jb20+Cj4+IC0tLQo+PiDCoCBk
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21hYy5jIHwgMjc3ICsrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+IMKgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmgg
fMKgwqAgMyArCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjgwIGluc2VydGlvbnMoKykKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvbWFjLmMgCj4+IGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYwo+PiBpbmRleCBiZmI5MDBkOTgz
NDcuLmYwNWQ2NjkxM2FiZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDExay9tYWMuYwo+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL21h
Yy5jCj4+IEBAIC03NjYxLDYgKzc2NjEsMjgzIEBAIHN0YXRpYyB1OCAKPj4gYXRoMTFrX21hY19n
ZXRfbnVtX3B3cl9sZXZlbHMoc3RydWN0IGNmZzgwMjExX2NoYW5fZGVmICpjaGFuX2RlZikKPj4g
wqDCoMKgwqDCoCB9Cj4+IMKgIH0KPj4gwqAgK3N0YXRpYyB1MTYgYXRoMTFrX21hY19nZXRfNmdo
el9zdGFydF9mcmVxdWVuY3koc3RydWN0IAo+PiBjZmc4MDIxMV9jaGFuX2RlZiAqY2hhbl9kZWYp
Cj4+ICt7Cj4+ICvCoMKgwqAgdTE2IGRpZmZfc2VxOwo+PiArCj4+ICvCoMKgwqAgLyogSXQgaXMg
dG8gZ2V0IHRoZSBsb3dlc3QgY2hhbm5lbCBudW1iZXIncyBjZW50ZXIgZnJlcXVlbmN5IG9mIAo+
PiB0aGUgY2hhbi4KPj4gK8KgwqDCoMKgICogRm9yIGV4YW1wbGUsCj4+ICvCoMKgwqDCoCAqIGJh
bmR3aWR0aD00MCBNSHosIGNlbnRlciBmcmVxdWVuY3kgaXMgNTk2NSwgbG93ZXN0IGNoYW5uZWwg
aXMgMQo+PiArwqDCoMKgwqAgKiB3aXRoIGNlbnRlciBmcmVxdWVuY3kgNTk1NSwgaXRzIGRpZmYg
aXMgNTk2NSAtIDU5NTUgPSAxMC4KPj4gK8KgwqDCoMKgICogYmFuZHdpZHRoPTgwIE1IeiwgY2Vu
dGVyIGZyZXF1ZW5jeSBpcyA1OTg1LCBsb3dlc3QgY2hhbm5lbCBpcyAxCj4+ICvCoMKgwqDCoCAq
IHdpdGggY2VudGVyIGZyZXF1ZW5jeSA1OTU1LCBpdHMgZGlmZiBpcyA1OTg1IC0gNTk1NSA9IDMw
Lgo+PiArwqDCoMKgwqAgKiBiYW5kd2lkdGg9MTYwIE1IeiwgY2VudGVyIGZyZXF1ZW5jeSBpcyA2
MDI1LCBsb3dlc3QgY2hhbm5lbCBpcyAxCj4+ICvCoMKgwqDCoCAqIHdpdGggY2VudGVyIGZyZXF1
ZW5jeSA1OTU1LCBpdHMgZGlmZiBpcyA2MDI1IC0gNTk1NSA9IDcwLgo+PiArwqDCoMKgwqAgKi8K
Pj4gK8KgwqDCoCBzd2l0Y2ggKGNoYW5fZGVmLT53aWR0aCkgewo+PiArwqDCoMKgIGNhc2UgTkw4
MDIxMV9DSEFOX1dJRFRIXzE2MDoKPj4gK8KgwqDCoMKgwqDCoMKgIGRpZmZfc2VxID0gNzA7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCBjYXNlIE5MODAyMTFfQ0hBTl9XSURU
SF84MDoKPj4gK8KgwqDCoCBjYXNlIE5MODAyMTFfQ0hBTl9XSURUSF84MFA4MDoKPj4gK8KgwqDC
oMKgwqDCoMKgIGRpZmZfc2VxID0gMzA7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8Kg
wqDCoCBjYXNlIE5MODAyMTFfQ0hBTl9XSURUSF80MDoKPj4gK8KgwqDCoMKgwqDCoMKgIGRpZmZf
c2VxID0gMTA7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gK8KgwqDCoCBkZWZhdWx0Ogo+
PiArwqDCoMKgwqDCoMKgwqAgZGlmZl9zZXEgPSAwOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDC
oMKgIHJldHVybiBjaGFuX2RlZi0+Y2VudGVyX2ZyZXExIC0gZGlmZl9zZXE7Cj4+ICt9Cj4+ICsK
Pj4gK3N0YXRpYyB1MTYgYXRoMTFrX21hY19nZXRfc2VnX2ZyZXEoc3RydWN0IGNmZzgwMjExX2No
YW5fZGVmICpjaGFuX2RlZiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1MTYgc3RhcnRfc2VxLCB1OCBzZXEpCj4+ICt7Cj4+ICvCoMKgwqAgdTE2IHNlZ19zZXE7Cj4+
ICsKPj4gK8KgwqDCoCAvKiBJdCBpcyB0byBnZXQgdGhlIGNlbnRlciBmcmVxdWVuY3kgb2YgdGhl
IHNwZWNpZmljIGJhbmR3aWR0aC4KPj4gK8KgwqDCoMKgICogc3RhcnRfc2VxIG1lYW5zIHRoZSBs
b3dlc3QgY2hhbm5lbCBudW1iZXIncyBjZW50ZXIgZnJlcXVlbmN5Lgo+PiArwqDCoMKgwqAgKiBz
ZXEgMC8xLzIvMyBtZWFucyAyMCBNSHovNDAgTUh6LzgwIE1Iei8xNjAgTUh6JjgwUDgwLgo+PiAr
wqDCoMKgwqAgKiBGb3IgZXhhbXBsZSwKPj4gK8KgwqDCoMKgICogbG93ZXN0IGNoYW5uZWwgaXMg
MSwgaXRzIGNlbnRlciBmcmVxdWVuY3kgNTk1NSwKPj4gK8KgwqDCoMKgICogY2VudGVyIGZyZXF1
ZW5jeSBpcyA1OTU1IHdoZW4gYmFuZHdpZHRoPTIwIE1IeiwgaXRzIGRpZmYgaXMgCj4+IDU5NTUg
LSA1OTU1ID0gMC4KPj4gK8KgwqDCoMKgICogbG93ZXN0IGNoYW5uZWwgaXMgMSwgaXRzIGNlbnRl
ciBmcmVxdWVuY3kgNTk1NSwKPj4gK8KgwqDCoMKgICogY2VudGVyIGZyZXF1ZW5jeSBpcyA1OTY1
IHdoZW4gYmFuZHdpZHRoPTQwIE1IeiwgaXRzIGRpZmYgaXMgCj4+IDU5NjUgLSA1OTU1ID0gMTAu
Cj4+ICvCoMKgwqDCoCAqIGxvd2VzdCBjaGFubmVsIGlzIDEsIGl0cyBjZW50ZXIgZnJlcXVlbmN5
IDU5NTUsCj4+ICvCoMKgwqDCoCAqIGNlbnRlciBmcmVxdWVuY3kgaXMgNTk4NSB3aGVuIGJhbmR3
aWR0aD04MCBNSHosIGl0cyBkaWZmIGlzIAo+PiA1OTg1IC0gNTk1NSA9IDMwLgo+PiArwqDCoMKg
wqAgKiBsb3dlc3QgY2hhbm5lbCBpcyAxLCBpdHMgY2VudGVyIGZyZXF1ZW5jeSA1OTU1LAo+PiAr
wqDCoMKgwqAgKiBjZW50ZXIgZnJlcXVlbmN5IGlzIDYwMjUgd2hlbiBiYW5kd2lkdGg9MTYwIE1I
eiwgaXRzIGRpZmYgaXMgCj4+IDYwMjUgLSA1OTU1ID0gNzAuCj4+ICvCoMKgwqDCoCAqLwo+PiAr
wqDCoMKgIGlmIChjaGFuX2RlZi0+d2lkdGggPT0gTkw4MDIxMV9DSEFOX1dJRFRIXzgwUDgwICYm
IHNlcSA9PSAzKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGNoYW5fZGVmLT5jZW50ZXJfZnJl
cTI7Cj4+ICsKPj4gK8KgwqDCoCBzZWdfc2VxID0gMTAgKiAoQklUKHNlcSkgLSAxKTsKPj4gK8Kg
wqDCoCByZXR1cm4gc2VnX3NlcSArIHN0YXJ0X3NlcTsKPj4gK30KPgo+IFRoZSBhYm92ZSB0d28g
ZnVuY3Rpb25zIGFyZSBkcml2ZXIgYWdub3N0aWMuIFdpbGwgb3RoZXIgZHJpdmVycyBuZWVkIAo+
IHRoaXMgYXMgd2VsbCwgYW5kIGlmIHNvLCBzaG91bGQgdGhlc2UgZ28gaW50byBjb3JlIHdpcmVs
ZXNzPwo+Ck5vdCBmb3VuZCBvdGhlciBkcml2ZXIgbmVlZCBpdC4gSWYgbW92ZSB0aGVtIHRvIGNv
cmUgd2lyZWxlc3MsIHRoZW4gaXQgCndpbGwgYmUgYSBuZXcgZGVwZW5kZW5jeSBmb3IgaXQuCgot
LSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
