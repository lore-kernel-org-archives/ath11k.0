Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED83C61DD6
	for <ath11k@archiver.kernel.org>; Wed,  2 Sep 2026 05:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=; b=vQOGtO/eAR9y0O8QlbeGcoCfHC
	FwF98wA9M+hHOr6IaL0TWoMZ/zCDuO/mHpfn5/ZpcvInzCfMI7x3FYMj8yIob7+m6iHT6aXi15aU9
	cZxdnNnoPcBS16p2sDdQTAPMeZLHp07Jv0ZEM9tRHRDh1DRVQeoDOKeJy42H16rDFIfIibM8UMo4s
	yNBjn3dSAovOSZ9UfFPrDFKLTxh61G+ovZRSSD912tTIIGiabAiI5gOkIweTSp7wpJswnbAUQFEum
	rXZ47L2hz91z580plBqrnqKXlL94yugs/5ZUTB8wtcrlQzk3kEIgHlfXf1FzokQglnOpkx7YTWxxg
	TzQYgmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1d54-0000000Dn2v-44vX;
	Wed, 02 Sep 2026 05:00:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1d52-0000000Dn2W-24Yc
	for ath11k@lists.infradead.org;
	Wed, 02 Sep 2026 05:00:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6824hV2Z2982861
	for <ath11k@lists.infradead.org>; Wed, 2 Sep 2026 05:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=; b=GFf5Fk2rMsztuFcz
	rFmQPBTUWjFkRyhhCNt//wTiHOe8no+ew81UVhl6HD5kiqdRZLffl9GwRWbKN+OG
	/vTbnP5izCxS6drAj+WagZ6tFSD4s2AeF+qu0SGmXIGZjMaUYqSeMO/GpbOYhLP/
	Op4SJHWfjrbpGQpaBkHZ587N01DNiaZEEsDWuFrrm9aVxy4pRUZ5Vi4eLXVO7UTU
	I5SnVcDRPIV/vDVMJP6o+iibdEH/dhoBKLhEh56YfpXwlQrcerIuA39uuRLyzWw6
	gikWwFGy/JI0FycFr4N5/namFdwUVYlom2KQsKY8Ly9ytf0BP166LvtTy262jOjI
	vp6YCA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge35k27cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 02 Sep 2026 05:00:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1245580a91.1
        for <ath11k@lists.infradead.org>; Tue, 01 Sep 2026 22:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325211; x=1788930011; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=;
        b=kLIWx0mtu7l1sg2VzZPRM0BJcIquheb6wbCO8KDgy7Ppnb9wrr/iR0ctUw4p8rMSUO
         t6aVIRK0wIlXS0znlJGapdY5hvm6FPwQT1aoYNYA1syApvZ952B/nSgF0YVvAWycohFZ
         XnydiPkJoFHzxR9dR3m/SALByuoJ4wtbS6jAaXWIbL08aodrJRd+4nia0NNyfNKgn3oD
         O9C5PwAuSq3urmLL0cHsoHpgX+yl3ZAbO3IW5lc/Qkd8IQtr7zLXO+6lJiYrYroO/KxE
         5ud4r9ri2so8ZZVqgjLRaio4/pwmF5kFU0hgMjQCnDPKhdxiR8OcSIywX2hns+kO+dVP
         EE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325211; x=1788930011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbp4FJAIx2sCHESOti5mBhN/XVSQP/x3rn9H9mnHh5s=;
        b=P3C05FDrTPILYiAaSj8Y/4sSC4WdAlJ1d8cT9Kp0GIilF9W81PQuo1oRanhTu525kM
         IDwfq0s9ZPo+AN0U3eDDviGn23OcHUNNTHM9IbI+Yltx7i3oKzkm7kCLGoeJBhfLUnJl
         OUjveroM3DV+O6Qk+Vd54TloTfjvknjENgYrRI2y8zC5gTubq089Wsm0MdE4U59czdcR
         3Gx5LDN3UhoKz4IYdhcEokvN8f+B6CmkwC1OjBS0pz5jR3J6Ipnsm0gLEvV8IeO6l7X/
         n7GW7xfm+rwSPhthMiB+5LLai93hHFOrWYyJRv6BAIr6qYeH7ou/XX4UMs2cKOdjs+w7
         8VZw==
X-Forwarded-Encrypted: i=1; AKwUvBzBvkOX5LCd31rR0D9E9YPQjVK+Ur3GiWM4KKbXW1HYd45PprGolOk4yGG+oNzXZ82iIEtOkV0=@lists.infradead.org
X-Gm-Message-State: AFuF++nml7UHFYBiPALeH9MrPJmtxLC03yJwEYKTt0X/YIIWRh2TH45+
	/15A8tOrUnBqKWepMFK0acT+JIuT7sc4syKId5OknZBvk7QAXTlyySu3PIqOgDDoMMG9l4uuxHs
	DSfgnmrhOoalZ5XA07VJFXQaZDcwpXuwBnzMV2MAd+5Hqmla/bqlaUWxWu/DH3mWJ1RVddkTE
X-Gm-Gg: AYBFou0A/mdejVXBtPA/m3zXYhHtvqRT9vTLB96nZ3ts3axOWW0YYGn20vk2JS2C/k8
	YeNQid5unlW4oOf/djmAaH6lXCO1kWOGiDCglixP0B6G9jk5vv9CPitjB21H7TCFHaZHkEGcDKF
	UTGLZL6hkHkzHX/pKEUFTr5s59CTGEb+8ogoEWveQ9Ytvv72+Xc1KGw4zMTnAS9cpn8RvXo/E/m
	kwmJVPNfejxcv5h9Dy/mZnDL4eTixduSJz7mmiYh3EVdc7o0+d425m+A1HvA0zdnrsiB870RhD9
	timAXX4NlRiu3/P9KEuIsFuttmq861SAqkSoa0EssLGAHUAihp68Jl0ZB2v4O8Brm/WgHeG3zqc
	zSXgLGosveX5eihHDBdfBEXdcsmV6AOdB
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr3407264a91.11.1788325210765;
        Tue, 01 Sep 2026 22:00:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39aedf435b8mr3407173a91.11.1788325210150;
        Tue, 01 Sep 2026 22:00:10 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f1a82sm2988817eec.10.2026.09.01.22.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:00:09 -0700 (PDT)
Message-ID: <50c5aa2c-32a8-42be-9947-f18994071863@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:30:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] bus: mhi: host: Add support for Bandwidth scale
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-4-6dea79786b37@oss.qualcomm.com>
 <tm33xb3nrq7v6ezoewvn34rteg47pmow27kda5mdmoufsckw7t@tzssd2mqm5zt>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <tm33xb3nrq7v6ezoewvn34rteg47pmow27kda5mdmoufsckw7t@tzssd2mqm5zt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX9nLZUrOmJ6LR
 9cLrXOMjWnwaDJ0ab02rjXcgywF/FZmJjl9lUfXn+ca13kmAq/AgauKVWNbYj0zQ6E3/Zh8VbWv
 ssrl4NypbhajKQBix6sNStWMMIWBwGfMIlHzLTB+tcTH3nvY5uhhk8h79odE2YL+WpXwdRvsvnR
 Jes1Y/aMf6P/ZIhAKqWwV7y61fiL01W1XSKZTNxk448C5LflOkmcx7sVj4E/9zT/9Yo8WNgCHpO
 Z21HQoR6MaxOObdyP4QhKoJz0FjwlSe34GO7JDddRBRTCKgd8+7Fow/7AWVEeejV0uPPqlrSv51
 MCRS5U3FxU79Ymy1hsjRFBgFPwf+lflMg0s/BIkMuUfPhN3pNa+2bORCHAOebT53ivphDHI/qPg
 +pS2wIRtDgX9mZfGLIi0RSsN7za2K4/un+QjvmzFh5ehoI3gnpwM8S0ofPmWq2p3XHdfSj+koJO
 7h+w9aO6gPGTQzT4xFg==
X-Proofpoint-GUID: SnnR4thbGWGacoOYCLHcxe3uJUtrZX-X
X-Proofpoint-ORIG-GUID: SnnR4thbGWGacoOYCLHcxe3uJUtrZX-X
X-Authority-Analysis: v=2.4 cv=VLrtWdPX c=1 sm=1 tr=0 ts=6a97ad5b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=H7oXqyE-OcRDxyOYSJ4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX99oSAsMtaJ6+
 WLUkdMkHZDRcaF/duT8cETPWU397TIre2rfTpQdE1zIWp2Y3cTZihOQGkyqpOQkyUwqv0Pr5siD
 r0odC+I6s0qy8Ew01tsp47NItgxuu+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_220012_548277_00A6F497 
X-CRM114-Status: GOOD (  34.20  )
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



On 9/1/2026 1:36 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 19, 2026 at 06:55:55PM +0530, Krishna Chaitanya Chundru wrote:
>> As per MHI spec v1.2, sec 14, MHI supports bandwidth scaling to reduce
>> power consumption. MHI bandwidth scaling is advertised by devices that
>> contain the bandwidth scaling capability registers. If enabled, the device
>> aggregates bandwidth requirements and sends them to the host through
>> dedicated mhi event ring. After the host performs the bandwidth switch,
>> it sends an acknowledgment by ringing a doorbell.
>>
>> if the host supports bandwidth scaling events, then it must set
>> BW_CFG.ENABLED bit, set BW_CFG.DB_CHAN_ID to the channel ID to the
>> doorbell that will be used by the host to communicate the bandwidth
>> scaling status and BW_CFG.ER_INDEX to the index for the event ring
>> to which the device should send bandwidth scaling request in the
>> bandwidth scaling capability register.
>>
>> As part of mmio init check if the bw scale capability is present or not,
>> if present advertise host supports bw scale by setting all the required
>> fields.
>>
>> MHI layer will only forward the bw scaling request to the controller
>> driver since MHI doesn't have any idea about transport layer used by
>> the controller, it is responsibility of the controller driver to do actual
>> bw scaling and then pass status to the MHI. MHI will response back to the
>> device based up on the status of the bw scale received.
>>
>> Add a new get_misc_doorbell() to get doorbell for misc capabilities to
>> use the doorbell with mhi events like MHI BW scale etc.
>>
>> Use workqueue & mutex for the bw scale events as the pci_set_target_speed()
>> which will called by the mhi controller driver can sleep.
>>
>> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/bus/mhi/common.h        |  13 +++++
>>  drivers/bus/mhi/host/init.c     |  93 +++++++++++++++++++++++++++++++--
>>  drivers/bus/mhi/host/internal.h |   6 ++-
>>  drivers/bus/mhi/host/main.c     | 113 +++++++++++++++++++++++++++++++++++++++-
>>  drivers/bus/mhi/host/pm.c       |  10 +++-
>>  drivers/bus/mhi/host/trace.h    |   7 +++
>>  include/linux/mhi.h             |  13 +++++
>>  7 files changed, 247 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
>> index 4c316f3d5a68..267260901a41 100644
>> --- a/drivers/bus/mhi/common.h
>> +++ b/drivers/bus/mhi/common.h
>> @@ -215,6 +215,19 @@
>>  #define MHI_CAP_ID_MAX_TRB_LEN		0x5
>>  #define MHI_CAP_ID_MAX			0x6
>>  
>> +/* MHI Bandwidth scaling offsets */
>> +#define MHI_BW_SCALE_CFG_OFFSET		0x4
>> +#define MHI_BW_SCALE_CAP_ID		(3)
>> +#define MHI_BW_SCALE_DB_CHAN_ID		GENMASK(31, 25)
>> +#define MHI_BW_SCALE_ENABLED		BIT(24)
>> +#define MHI_BW_SCALE_ER_INDEX		GENMASK(23, 19)
>> +
>> +#define MHI_TRE_GET_EV_BW_REQ_SEQ(tre)	FIELD_GET(GENMASK(15, 8), (MHI_TRE_GET_DWORD(tre, 0)))
>> +
>> +#define MHI_BW_SCALE_RESULT(status, seq)	(FIELD_PREP(GENMASK(11, 8), status) | \
>> +						FIELD_PREP(GENMASK(7, 0), seq))
>> +#define MHI_BW_SCALE_NACK			0xF
> 0xf
>
>> +
>>  enum mhi_pkt_type {
>>  	MHI_PKT_TYPE_INVALID = 0x0,
>>  	MHI_PKT_TYPE_NOOP_CMD = 0x1,
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index 32db4aa4bbe8..d0975b6c2df0 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -497,10 +497,66 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
>>  	return 0;
>>  }
>>  
>> +static int mhi_get_er_index(struct mhi_controller *mhi_cntrl,
>> +			    enum mhi_er_data_type type)
>> +{
>> +	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>> +	int i;
>> +
>> +	/* Find event ring for requested type */
>> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>> +		if (mhi_event->data_type == type)
>> +			return mhi_event->er_index;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +static int mhi_init_bw_scale(struct mhi_controller *mhi_cntrl,
>> +			     int bw_scale_db)
>> +{
>> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	struct mhi_event *mhi_event;
>> +	u32 bw_cfg_offset, val;
>> +	int er_index, i;
>> +
>> +	bw_cfg_offset = mhi_find_capability(mhi_cntrl, MHI_BW_SCALE_CAP_ID);
>> +	if (!bw_cfg_offset)
>> +		return 0;
>> +
>> +	er_index = mhi_get_er_index(mhi_cntrl, MHI_ER_BW_SCALE);
>> +	if (er_index < 0)
>> +		return er_index;
>> +
>> +	/* Initialize BW scale event ring resources */
>> +	mhi_event = mhi_cntrl->mhi_event;
>> +	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>> +		if (mhi_event->data_type == MHI_ER_BW_SCALE) {
>> +			INIT_WORK(&mhi_event->work, mhi_process_ev_work);
>> +			mutex_init(&mhi_event->mutex);
> Why do you need mutex only for this event and not for other events?
For other events we are using spinlocks, we can't use spinlock for this event
as pci framework is using mutex locks internally as part of
pcie_set_target_speed()
>> +			break;
>> +		}
>> +	}
>> +
>> +	bw_cfg_offset += MHI_BW_SCALE_CFG_OFFSET;
>> +
>> +	/* Advertise host support */
>> +	val = FIELD_PREP(MHI_BW_SCALE_DB_CHAN_ID, bw_scale_db) |
>> +			 FIELD_PREP(MHI_BW_SCALE_ER_INDEX, er_index) |
>> +			 MHI_BW_SCALE_ENABLED;
>> +
>> +	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, bw_cfg_offset, val);
>> +
>> +	dev_dbg(dev, "Bandwidth scaling setup complete with event ring: %d\n",
>> +		er_index);
>> +
>> +	return 0;
>> +}
>> +
>>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  {
>> -	u32 val;
>> -	int i, ret;
>> +	u32 val, chdb_offset;
>> +	int i, ret, doorbell = 0;
>>  	struct mhi_chan *mhi_chan;
>>  	struct mhi_event *mhi_event;
>>  	void __iomem *base = mhi_cntrl->regs;
>> @@ -581,6 +637,8 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  		return -ERANGE;
>>  	}
>>  
>> +	chdb_offset = val;
>> +
>>  	/* Setup wake db */
>>  	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
>>  	mhi_cntrl->wake_set = false;
>> @@ -634,6 +692,17 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>>  		return ret;
>>  	}
>>  
>> +	if (mhi_cntrl->get_misc_doorbell)
>> +		doorbell = mhi_cntrl->get_misc_doorbell(mhi_cntrl, MHI_ER_BW_SCALE);
> Why can't you add the doorbell number to 'mhi_event_config'?
ack.
>> +
>> +	if (doorbell > 0) {
>> +		ret = mhi_init_bw_scale(mhi_cntrl, doorbell);
>> +		if (!ret)
>> +			mhi_cntrl->bw_scale_db = base + chdb_offset + (8 * doorbell);
>> +		else
>> +			dev_warn(dev, "Failed to setup bandwidth scaling: %d\n", ret);
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -778,6 +847,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>>  		case MHI_ER_CTRL:
>>  			mhi_event->process_event = mhi_process_ctrl_ev_ring;
>>  			break;
>> +		case MHI_ER_BW_SCALE:
>> +			mhi_event->process_event = mhi_process_bw_scale_ev_ring;
>> +			break;
>>  		default:
>>  			dev_err(dev, "Event Ring type not supported\n");
>>  			goto error_ev_cfg;
>> @@ -1001,10 +1073,12 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>>  
>>  		mhi_event->mhi_cntrl = mhi_cntrl;
>>  		spin_lock_init(&mhi_event->lock);
>> -		if (mhi_event->data_type == MHI_ER_CTRL)
>> +		if (mhi_event->data_type == MHI_ER_CTRL) {
>>  			tasklet_init(&mhi_event->task, mhi_ctrl_ev_task,
>>  				     (ulong)mhi_event);
>> -		else
>> +		} else if (mhi_event->data_type == MHI_ER_BW_SCALE) {
>> +		/* BW scale resources will be initialized in mhi_init_mmio() if capability exists */
> But you are just skipping the tasklet here. Provide an apt reason for that.
we are using workqueue, for bw scale, as we cannot use mutex in tasklet. I
will add a comment there.

- Krishna Chaitanya.
>
> - Mani
>


