Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E1EC25B74
	for <ath11k@archiver.kernel.org>; Thu, 30 May 2024 06:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WpJva/UfKszn14kM8O9sUFGcZzIvLNN3CRSXXUoWfk=; b=jiD+goIPcI3vtUrW+7zWd16CcQ
	wxQzYMIxefaUgRdE2avlztRx7B14hWirxGYRDrwPUm7WgLGXUrZVaBnEoRo0NNbiRISxWBdhYdoWa
	gH5dsPuMieIs3ZdArR6/WIBtZTIx2ONABfS0XuLwGiNSxz/XUTLDH6KeFPn83xpEOivg6X1C+NjH9
	BqgKlphKA5jWPJlNEpZTyV79neeHoQx5EACX4U3U5qMX1yHisjcfimWUYvW9yAEqTopN/DPKw7Vbm
	clELKNweuKU1VCX8a9zPm53kpHCazYm33EBUZmjY7bpS361CIMMko3QV6HrEDKy14t6aXtipqa91L
	GW7FXREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCZCQ-00000006Q7j-41G3;
	Thu, 30 May 2024 06:23:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCZCL-00000006Q5k-1xTI
	for ath11k@lists.infradead.org;
	Thu, 30 May 2024 06:23:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TMCSwL021170;
	Thu, 30 May 2024 06:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WpJva/UfKszn14kM8O9sUFGcZzIvLNN3CRSXXUoWfk=; b=Pf3514e8pUr0MdYH
	tzTC3qEONTQva6YMKXrZJPIVJ/eO6xh/HV/tvLP3WHU2mVPQFmfYJEG7xe2ebFJt
	eG1BKDGitVDrwr0W2DjMrgvmJV41NsuBCGZgIcF0BeRI9q5XTCNoRgUrkeAUsOjF
	mgvrRItWW1tmk5DNFjNVw4+C1WEI849Hagr39mO+mzuwky7t46SchAnZW97w+OQp
	HT7CAJdRdP9VqVx2PyWMCpgE7KUIAKOk+69tOSXZOgGO7rVn16Rd3EcJNwS4wVUa
	C8/QSNM7hYLrNgdZvEmW55taDtL34dVIqYWvK3B4Ov5Us73Eh1dIj6nPKev3epUC
	yggbZg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pu1mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 06:23:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U6NOJL021760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 06:23:24 GMT
Received: from [10.253.79.103] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 23:23:23 -0700
Message-ID: <6c8ca575-01b7-41ba-97d9-cfe28f69c1e6@quicinc.com>
Date: Thu, 30 May 2024 14:23:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] wifi: ath11k: add P2P IE in beacon template
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <2d277abd-5e7b-4da0-80e0-52bd96337f6e@moroto.mountain>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <2d277abd-5e7b-4da0-80e0-52bd96337f6e@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G59UKcIGKQm25Fl434O9Mmeg2O3cdHuo
X-Proofpoint-GUID: G59UKcIGKQm25Fl434O9Mmeg2O3cdHuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_03,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_232337_640332_31A55A6F 
X-CRM114-Status: GOOD (  12.36  )
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



On 5/29/2024 10:32 PM, Dan Carpenter wrote:
> Hello Kang Yang,
> 
> Commit 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
> from Feb 28, 2024 (linux-next), leads to the following Smatch static
> checker warning:
> 
> 	drivers/net/wireless/ath/ath11k/wmi.c:1742 ath11k_wmi_p2p_go_bcn_ie()
> 	warn: sleeping in atomic context
> 
> drivers/net/wireless/ath/ath11k/wmi.c
>      1712 int ath11k_wmi_p2p_go_bcn_ie(struct ath11k *ar, u32 vdev_id,
>      1713                              const u8 *p2p_ie)
>      1714 {
>      1715         struct ath11k_pdev_wmi *wmi = ar->wmi;
>      1716         struct wmi_p2p_go_set_beacon_ie_cmd *cmd;
>      1717         size_t p2p_ie_len, aligned_len;
>      1718         struct wmi_tlv *tlv;
>      1719         struct sk_buff *skb;
>      1720         int ret, len;
>      1721
>      1722         p2p_ie_len = p2p_ie[1] + 2;
>      1723         aligned_len = roundup(p2p_ie_len, 4);
>      1724
>      1725         len = sizeof(*cmd) + TLV_HDR_SIZE + aligned_len;
>      1726
>      1727         skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
>      1728         if (!skb)
>      1729                 return -ENOMEM;
>      1730
>      1731         cmd = (struct wmi_p2p_go_set_beacon_ie_cmd *)skb->data;
>      1732         cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_P2P_GO_SET_BEACON_IE) |
>      1733                           FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
>      1734         cmd->vdev_id = vdev_id;
>      1735         cmd->ie_buf_len = p2p_ie_len;
>      1736
>      1737         tlv = (struct wmi_tlv *)cmd->tlv;
>      1738         tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_BYTE) |
>      1739                       FIELD_PREP(WMI_TLV_LEN, aligned_len);
>      1740         memcpy(tlv->value, p2p_ie, p2p_ie_len);
>      1741
> --> 1742         ret = ath11k_wmi_cmd_send(wmi, skb, WMI_P2P_GO_SET_BEACON_IE);
>                         ^^^^^^^^^^^^^^^^^^^
> This is a might_sleep() function.
> 
>      1743         if (ret) {
>      1744                 ath11k_warn(ar->ab, "failed to send WMI_P2P_GO_SET_BEACON_IE\n");
>      1745                 dev_kfree_skb(skb);
>      1746         }
>      1747
>      1748         return ret;
>      1749 }
> 
> The problematic call tree is:
> 
> ath11k_bcn_tx_status_event() <- disables preempt
> -> ath11k_mac_bcn_tx_event()
>     -> ath11k_mac_setup_bcn_tmpl()
>        -> ath11k_mac_setup_bcn_tmpl_ema()
>        -> ath11k_mac_setup_bcn_tmpl_mbssid()
>           -> ath11k_mac_set_vif_params()
>              -> ath11k_mac_setup_bcn_p2p_ie()
>                 -> ath11k_wmi_p2p_go_bcn_ie()
> 
> The ath11k_bcn_tx_status_event() function takes rcu_read_lock() which
> disables preemption.  I don't know the code well enough to say if this
> is a real bug...  If it's a false positive, just ignore it.  These are
> one time emails.


I also found:

ath11k_bcn_tx_status_event() <- disables preempt
-> ath11k_mac_bcn_tx_event()
	-> ath11k_mac_setup_bcn_tmpl()
		-> ath11k_mac_setup_bcn_tmpl_ema()
		-> ath11k_mac_setup_bcn_tmpl_mbssid()
			->ath11k_wmi_bcn_tmpl()
				->ath11k_wmi_cmd_send()


It seems this problem already exist even if without my patch.


Fine, i will find solution for this.

> 
> See my blog for more details.
> https://staticthinking.wordpress.com/2024/05/24/sleeping-in-atomic-warnings/
>  > regards,
> dan carpenter

