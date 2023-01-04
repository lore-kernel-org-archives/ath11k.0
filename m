Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6195AC3DA7D
	for <ath11k@archiver.kernel.org>; Wed,  4 Jan 2023 03:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1w6sON/6BIPlLQkTmv+j9Ur/zLLdtnE6I5on2BkLPzI=; b=Jctjz1Z2AsmDG+
	hfwlPp8HQCGlQ8wQwQmLvnRY1vg34PXQTzXVHuUy3pwNZJOS8rdmeIjn7gH5pFMTJ8XV4wp+/4wqB
	WntAkJXe6JCXZKtocet/m9WTv6BRnOZWme6zIxJ69aDbSiobJnCq820G0ymi9gdTcIlExhgB1uQf0
	VmFHZR+0U67zzg2s2hDn2DHfoG3OaYjVpohw0otc+blWSTgW7EhTcLKK+uc7zZXs4LW2DZQzSV0IX
	27O7546xkkLHOCe9tlg4APJTyF03lck8IZZt4pbyuz/qxlO3NA23CEeJ6Z5Cr6wieWspJbyJX6vew
	gTHeS8IJ9zkqbW7DF5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCuHw-006Xyi-8G; Wed, 04 Jan 2023 03:18:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCuHb-006Xvc-Kr
	for ath11k@lists.infradead.org; Wed, 04 Jan 2023 03:17:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3041Hebh017589;
	Wed, 4 Jan 2023 03:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0XWWvi91s0nxwXMJlepFLsP9HVt69U3mlZhv35tFFQU=;
 b=Mu9T6Uh0+LmyfySxB5OEm9kr+AYUVbdS8uTT3W1dZ9VGgR6sxGOUA7/aIe4Qq++8ZJyp
 PjxUqwg6t/WEOlBwUuIfapizDxNQgENNcHiE31zcEuBbRYM6dIVYbgoZq01baUfKLNUl
 gJ0CQAg3gGzzpmHa6fE+CuZRCAmJ9lnB/hq/0zQkBfLtQiMdMNkaMRuAtONlbaFIKE6U
 46fkEc/A7jf8G1zJNL28U4yZDxK8IAY0soUA3uHQWFdyTWuqC/eyXRsAp6fNNXb1svKK
 ds0WIi5+Lri/VgZxrtah47t+cJi7vna2XeLvy5RqPYvnuIm/QPpujCgCtGL8U/6dMp+o wQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvwrv0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 03:17:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3043Hatr030567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jan 2023 03:17:36 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 3 Jan 2023
 19:17:34 -0800
Message-ID: <b0e8d03f-0e4e-b736-aa9d-cd49181d9041@quicinc.com>
Date: Wed, 4 Jan 2023 11:17:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] bus: mhi: host: Change the log levels for SYS_ERR event
Content-Language: en-US
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
CC: <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <mhi@lists.linux.dev>
References: <20230104021445.47484-1-quic_bqiang@quicinc.com>
 <CAOCk7NpGBD-2nHFBE3a4WxNb4XPhEV3uoCDz1J9ArbaOE7Vscg@mail.gmail.com>
 <7dac372b-167c-2dff-b207-6e32fd40c7bb@quicinc.com>
 <CAOCk7NqNrxcXLsw3PRRdsiOrq5SB9DfxpuSH84-rB9-43fdpog@mail.gmail.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <CAOCk7NqNrxcXLsw3PRRdsiOrq5SB9DfxpuSH84-rB9-43fdpog@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wt-U8mOX8YDKIaLOfFdHBUGofwXwDp5i
X-Proofpoint-ORIG-GUID: Wt-U8mOX8YDKIaLOfFdHBUGofwXwDp5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_08,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_191740_038895_F3B60E5A 
X-CRM114-Status: GOOD (  23.04  )
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

Ck9uIDEvNC8yMDIzIDExOjExIEFNLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MywgMjAyMyBhdCA3OjU3IFBNIEJhb2NoZW4gUWlhbmcgPHF1aWNfYnFpYW5nQHF1aWNpbmMuY29t
PiB3cm90ZToKPj4KPj4gT24gMS80LzIwMjMgMTA6NDEgQU0sIEplZmZyZXkgSHVnbyB3cm90ZToK
Pj4+IFdoeSB3YXMgdGhpcyBub3Qgc2VudCB0byB0aGUgTUhJIG1haWxpbmcgbGlzdD8KPj4gSSBk
b24ndCBrbm93IHRoZSBNSEkgbWFpbGluZyBsaXN0IGFkZHJlc3MsIGNvdWxkIHRlbGwgbWUgdGhh
dD8KPiBUaGUgcmVsZXZhbnQgZW50cnkgZnJvbSBNQUlOVEFJTkVSUyAtCj4KPiBNSEkgQlVTCj4g
TTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9y
Zz4KPiBMOiBtaGlAbGlzdHMubGludXguZGV2Cj4gTDogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5l
bC5vcmcKPiBTOiBNYWludGFpbmVkCj4gVDogZ2l0IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9tYW5pL21oaS5naXQKPiBGOiBEb2N1bWVudGF0aW9uL0FCSS9z
dGFibGUvc3lzZnMtYnVzLW1oaQo+IEY6IERvY3VtZW50YXRpb24vbWhpLwo+IEY6IGRyaXZlcnMv
YnVzL21oaS8KPiBGOiBpbmNsdWRlL2xpbnV4L21oaS5oCj4KPj4+IE9uIFR1ZSwgSmFuIDMsIDIw
MjMgYXQgNzoxOSBQTSBCYW9jaGVuIFFpYW5nIDxxdWljX2JxaWFuZ0BxdWljaW5jLmNvbT4gd3Jv
dGU6Cj4+Pj4gQ3VycmVudGx5IG5vIGxvZyBwcmludGVkIHdoZW4gU1lTX0VSUiBoYXBwZW5zLCB0
aGlzIG1ha2VzCj4+Pj4gZGVidWcgcXVpdGUgaGFyZCwgc28gY2hhbmdlIGxvZyBsZXZlbCB0byBt
YWtlIGl0IG5vaXN5Lgo+Pj4gWW91IGFyZSBnb2luZyB0byBuZWVkIHRvIGV4cGxhaW4gdGhpcyBt
b3JlLgo+Pj4gVGhlcmUgYXJlIHR3byBkcml2ZXJzIGluIHRoZSB1cHN0cmVhbSBrZXJuZWwgdGhh
dCBhcmUgTUhJIGNsaWVudHMgLQo+Pj4gcGNpX2dlbmVyaWMgYW5kIGF0aDExay4KPj4+IEknbSBh
c3N1bWluZyB0aGF0IHlvdSBjYXJlIGFib3V0IGF0aDExayBiZWNhdXNlIHlvdSBpbmNsdWRlZCB0
aGF0IG1haWwgbGlzdC4KPj4gWWVzLCBJIGFtIHRhbGtpbmcgYWJvdXQgYXRoMTFrLgo+Pj4gSW4g
YXRoMTFrX21oaV9vcF9zdGF0dXNfY2IoKSBJIHNlZSBhIHdhcm5pbmcgbWVzc2FnZSBwcmludGVk
IHdoZW4gdGhlCj4+PiBzeXNlcnIgY2FsbGJhY2sgaXMgdHJpZ2dlcmVkLgo+Pj4gSSBzZWUgc29t
ZXRoaW5nIHNpbWlsYXIgaW4gcGNpX2dlbmVyaWMuCj4+Pgo+Pj4gTG9va3MgbGlrZSBhIGxvZyBp
cyBwcmludGVkIHdoZW4gU1lTX0VSUiBoYXBwZW5zIGluIGFsbCBwb3NzaWJsZQo+Pj4gc2NlbmFy
aW9zLCBzbyBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIHBvaW50IG9mIHRoaXMgY2hhbmdlLgo+Pj4g
UGFydGljdWxhcmx5IGdpdmVuIHRoYXQgZGV2X2RiZyBtZXNzYWdlcyBjYW4gYmUgdHJpdmlhbGx5
IGVuYWJsZWQuCj4+Pgo+Pj4gLUplZmYKPj4gV2VsbCwgdGhpcyBpcyBub3QgdHJ1ZSBpbiBzb21l
IGNhc2VzLiBGb3IgZXhhbXBsZSwgd2UgaGF2ZSBtZXQgY2FzZXMgd2hlcmUKPj4KPj4gV0xBTiBI
Vy9maXJtd2FyZSBpcyBub3Qgd29ya2luZyB3ZWxsLCBhbmQgb25seSBzZW5kIGEgU1lTX0VSUiBl
dmVudCB0byBNSEkKPj4KPj4gZHJpdmVyLCBob3dldmVyIHRoaXMgZXZlbnQgaXMgbm90IHNlbnQg
dG8gYXRoMTFrIGhvc3QgYmVjdWFzZSBvZgo+PiBtaGlfcG1fc3lzX2Vycl9oYW5kbGVyKCksCj4+
Cj4+IHNvIHdlIGdvdCBubyBsb2cgYXQgYWxsLgo+Pgo+IFdpdGggdGhlIDYuMSBrZXJuZWw/Cj4K
PiBtaGlfcG1fc3lzX2Vycl9oYW5kbGVyKCkgcXVldWVzIHRoZSBzdF93b3JrZXIuCj4KPiBtaGlf
cG1fc3Rfd29ya2VyKCkgLCB3aGljaCBpcyB0aGUgc3Rfd29ya2VyIGZ1bmN0aW9uLCBjYWxscwo+
IG1oaV9wbV9zeXNfZXJyb3JfdHJhbnNpdGlvbigpIGluIHRoZSBERVZfU1RfVFJBTlNJVElPTl9T
WVNfRVJSIGNhc2UKPiAod2UgYXJlIHByb2Nlc3NpbmcgYSBTWVNfRVJSKS4KPgo+IFByZXR0eSBt
dWNoIHRoZSBmaXJzdCB0aGluZyBtaGlfcG1fc3lzX2Vycl90cmFuc2l0aW9uKCkgZG9lcyBpcyB0
aGlzIC0KPgo+IC8qIFdlIG11c3Qgbm90aWZ5IE1ISSBjb250cm9sIGRyaXZlciBzbyBpdCBjYW4g
Y2xlYW4gdXAgZmlyc3QgKi8KPiBtaGlfY250cmwtPnN0YXR1c19jYihtaGlfY250cmwsIE1ISV9D
Ql9TWVNfRVJST1IpOwo+Cj4gV2hpY2ggY2FsbHMgdGhlIGF0aDExayBkcml2ZXIgYXRoMTFrX21o
aV9vcF9zdGF0dXNfY2IoKSBJIG1lbnRpb25lZCBlYXJsaWVyLgo+Cj4gLUplZmYKCgpObywgbWhp
X3BtX3N5c19lcnJfaGFuZGxlcigpIHdpbGwgTk9UIHF1ZXVlIHRoZSBzdF93b3JrZXIgYmVjYXVz
ZSBhdGgxMWsgCmhvc3Qgc3VwcG9ydHMgUkRETSwgc28gdGhlIFNZU19FUlIgZXZlbnQgd2lsbCBi
ZSBza2lwcGVkLiBTZWUgYmVsb3cgbG9nOgoKa2VybmVsOiBbwqAgMTY1LjM5MzcyMF0gbWhpIG1o
aTA6IGxvY2FsIGVlOiBNSVNTSU9OIE1PREUgc3RhdGU6IE0wIGRldmljZSAKZWU6IFJBTURVTVAg
RE9XTkxPQUQgTU9ERSBzdGF0ZTogTTAKa2VybmVsOiBbwqAgMTY1LjQwMTgyMF0gbWhpIG1oaTA6
IFN0YXRlIGNoYW5nZSBldmVudCB0byBzdGF0ZTogU1lTIEVSUk9SCmtlcm5lbDogW8KgIDE2NS40
MDE4MjRdIG1oaSBtaGkwOiBTeXN0ZW0gZXJyb3IgZGV0ZWN0ZWQKa2VybmVsOiBbwqAgMTY1LjQw
MTgyN10gbWhpIG1oaTA6IENvbnRyb2xsZXIgc3VwcG9ydHMgUkRETSwgc2tpcCBTWVNfRVJST1IK
CgotLSAKYXRoMTFrIG1haWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
